class ItemsController < ApplicationController
  before_action :move_to_top, :only => [:new, :create, :destroy, :management, :tag_addition, :data_list, :management]
  # InvalidAuthenticityToken発生抑止
  protect_from_forgery except: :create
  $fixed_tags = ["動物","カップル","ポジティブ系","ネガティブ系","案内系","ロマンチック","かわいい","かっこいい","おもしろい","立つ","座る","寝そべる",]

  def index
    @items = Item.all.order("id DESC").page(params[:page]).per(15)
    @user = current_user
  end

  def new # 管理者による新規素材作成画面
    @item = Item.new
  end

  def create # 管理者による新規素材作成保存処理
    Item.create(title: item_params[:title], cr_item: item_params[:cr_item], dl_item: item_params[:dl_item])
    redirect_to "/items/data_list"
  end
  
  def data_list # 管理者による素材一覧画面
    @items = Item.includes(:tags).order("id DESC").page(params[:page]).per(50)
  end

  def management # 管理者による素材編集画面
    # form_forをビューで有効にするためには、newメソッドを呼び出しておく必要があるため、
    # @item = Item..find(params[:id])ではなく、@selected_itemを定義
    @selected_item = Item.find(params[:id])
    @fixed_tags_obj = ["動物","カップル"]
    @fixed_tags_impre = ["ポジティブ系","ネガティブ系","案内系"]
    @fixed_tags_looks = ["ロマンチック","かわいい","かっこいい","おもしろい"]
    @fixed_tags_act = ["立つ","座る","寝そべる"]
    @item = Item.new
  end

  def tag_addition # 管理者によるタグの新規登録処理
    @item = Item.find(params[:id])
    @item.tags.build(adopt_tag: tag_params[:adopt_tag], item_title: @item.title)
    @item.save
    redirect_to "/items/#{@item.id}/management"
  end
  
  def destroy # 管理者による素材削除処理
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to action: "data_list"
  end
  
  def update # 管理者による素材編集処理
    @selected_item = Item.find(params[:id])
    @selected_item.update(title: item_params[:title], cr_item: item_params[:cr_item], dl_item: item_params[:dl_item])
    redirect_to action: "management"
  end

  def search
    @searched_items = Item.search(params[:search]).order("items.created_at DESC").page(params[:page]).per(25)
    redirect_to "/items/not_found" if @searched_items.blank?
  end

  def pre_show # ユーザーによるタグ提案画面
    #form_forをビューで有効にするためには、newメソッドを呼び出しておく必要があるため、@selected_itemを定義
    @selected_item = Item.find(params[:id])
    @item = Item.new
  end

  def maketag # ユーザーによるタグ提案保存処理
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
    # pre_showの変数を継承
    @selected_item = Item.find(params[:id])
  end

  def download
    @item = Item.find(params[:id])
    # headerとfooterを非表示化
    render :download, layout: false
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
    redirect_to "/" unless user_signed_in? and current_user.admin?
  end
end
