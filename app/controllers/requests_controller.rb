class RequestsController < ApplicationController
  before_action :move_to_login, :only => [:new, :create, :destroy, :index]
  before_action :move_to_top, :only => [:requests_list, :show, :update] # 管理者画面への侵入をブロック
  helper_method :create_to_save

  def new #リクエスト投稿画面
    @user = current_user
    @nickname = current_user.nickname
    @requests = current_user.requests.order("created_at DESC")
    @request = Request.new
  end

  def index # リクエスト送信失敗後、更新された際の処理
    redirect_to action: "new"
  end

  def create #リクエスト投稿保存処理
    if current_user.requests.count == 0
      # 新規登録したユーザーの初リクエストを保存
      create_to_save
    elsif current_user.requests.last.status == 1
      # 前回リクエストが完了していない場合は保存しない
      flash[:status_fail] = "リクエストできるのは1件ずつです。前回リクエストの完了をお待ち下さい。"
      redirect_to action: "new"
    elsif current_user.requests.count >= 3 
      # リクエスト保存件数が3件に達している場合は保存しない
      flash[:amount_fail] = "リクエスト出来るのは最大3件です。保存済みリクエストを削除して下さい。"
      redirect_to action: "new"
    else 
      # 問題なくリクエストを保存する場合
      create_to_save
    end
  end

  def destroy #リクエスト削除処理
    @request = Request.find(params[:id])
    @request.image.purge if @request.image.attached?
    if @request.destroy
      flash[:delete_success] = "削除が完了しました。"
      redirect_to action: "new"
    else
      flash[:delete_fail] = "削除に失敗しました。"
      redirect_to action: "new"
    end
  end  

  def show # 管理者によるリクエスト詳細確認画面
    @request = Request.find(params[:id])
  end

  def requests_list #管理者によるリクエスト一覧確認画面
    @requests = Request.includes(:user).order("created_at DESC").page(params[:page]).per(50)
  end

  def update #管理者によるリクエスト編集（ステータス更新・ダウンロード可能）処理
    @request = Request.find(params[:id])
    @user = @request.user
    @request.update(status: update_params[:status], created_item_id: update_params[:created_item_id])
    InquiryMailer.status_cheanged_email(@user).deliver
    redirect_to action: "show"
  end

  private

  def request_params
    params.require(:request).permit(:image, :name, :text)
  end

  def move_to_login
    redirect_to "/users/sign_in" unless user_signed_in?
  end

  def update_params
    params.require(:request).permit(:status, :created_item_id)
  end

  def move_to_top
    redirect_to "/" unless user_signed_in? and current_user.admin?
  end
  
  def create_to_save
    @request = current_user.requests.build(name: request_params[:name], text: request_params[:text], status: 1)
    @request.image.attach(request_params[:image])
      if @request.save
        flash[:success] = "リクエストが正常に完了しました。作成ステータスが変更されるとメールでお知らせ致します。"
        InquiryMailer.request_occured_email.deliver
        @user = current_user
        InquiryMailer.request_accepted_email(@user).deliver
        redirect_to action: "new"
      else
        flash[:save_fail] = "リクエストの送信に失敗しました。"
        @requests = current_user.requests.order("created_at DESC")
        @user = current_user
        @nickname = current_user.nickname
        render action: :new
      end    
  end  
end
