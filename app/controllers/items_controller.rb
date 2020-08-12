class ItemsController < ApplicationController
  before_action :move_to_top, :only => [:new, :create, :destroy, :management, :tag_addition, :data_list, :management]
  # InvalidAuthenticityToken発生抑止
  protect_from_forgery except: :create

  def index
    @items = Item.all.order("id DESC").page(params[:page]).per(15)
    @user = current_user
  end

  def new # 管理者による新規素材作成画面
    @item = Item.new
  end

  def create # 管理者による新規素材作成保存
    Item.create(title: item_params[:title], cr_item: item_params[:cr_item], dl_item: item_params[:dl_item])
    redirect_to "/items/data_list"
  end
  
  def destroy # 管理者による素材削除
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to action: "data_list"
  end
  
  def update # 管理者による素材編集
    @selected_item = Item.find(params[:id])
    @selected_item.update(title: item_params[:title], cr_item: item_params[:cr_item], dl_item: item_params[:dl_item])
    redirect_to action: "management"
  end

  def search
    @searched_items = Item.search(params[:search]).order("items.created_at DESC").page(params[:page]).per(25)
    if @searched_items.blank?
      redirect_to "/items/not_found"
    end
  end

  def pre_show # ユーザーのタグ提案画面
    #form_forをビューで有効にするためには、newメソッドを呼び出しておく必要があるため、@selected_itemを定義
    @selected_item = Item.find(params[:id])   
    @item = Item.new
  end

  def maketag # ユーザーのタグ提案保存
    @item = Item.find(params[:id])
    @item.suggests.build(suggest_tag: maketag_params[:suggest_tag], item_title: @item.title)
    if @item.save
      InquiryMailer.maketag_email(@item).deliver
      redirect_to "/items/#{@item.id}"
    else
      flash.now[:alert] = "20文字以内のタグを入力して下さい！"
      render :pre_show
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def download
    @item = Item.find(params[:id])
    # headerとfooterを非表示化
    render :download, layout: false
  end

  def data_list
    @items = Item.includes(:tags).order("id DESC").page(params[:page]).per(50)
  end

  def management
    #form_forをビューで有効にするためには、newメソッドを呼び出しておく必要があるため、@selected_itemを定義
    @selected_item = Item.find(params[:id])   
    @item = Item.new
  end

  def tag_addition # タグの新規登録メソッド
    @item = Item.find(params[:id])
    @item.tags.build(adopt_tag: tag_params[:adopt_tag], item_title: @item.title)
    @item.save
    redirect_to "/items/#{@item.id}/management"
  end
  
  private

  def maketag_params
    params.require(:suggests).permit(:suggest_tag)
  end

  def tag_params
    params.require(:tags).permit(:adopt_tag)
  end

  def item_params
    params.require(:item).permit(:title, :cr_item, :dl_item)
  end

  def move_to_top
    if user_signed_in? and current_user.admin?
    else
      redirect_to "/"
    end
  end
end
