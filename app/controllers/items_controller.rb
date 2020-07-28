class ItemsController < ApplicationController
    
    protect_from_forgery except: :create
    # ↑が無いとタグ投稿時、ときどきInvalidAuthenticityTokenが発生する
    
    def index
        @items =  Item.all.order("id DESC").page(params[:page]).per(15)
        @user = current_user
    end
    
    def new
        @item = Item.new
    end
    
    def create
        Item.create(title: item_params[:title], cr_item: item_params[:cr_item], dl_item: item_params[:dl_item])
        redirect_to "/items/data_list"
    end
    

    
    def search
        @searched_items = Item.search(params[:search]).order("items.created_at DESC").page(params[:page]).per(25)
        if @searched_items.blank?
          redirect_to "/items/not_found"
        end
    end
    
    def pre_show
        @item = Item.find(params[:id])
    end
    
    
    def maketag
        @item = Item.find(params[:id])
        @item.suggests.build(suggest_tag: maketag_params[:suggest_tag], item_title: @item.title)
        if @item.save
        # createはダメだった。。
        InquiryMailer.maketag_email(@item).deliver
        redirect_to "/items/#{@item.id}/show"
        else
            flash.now[:alert] = "２０文字以内のタグを入力して下さい！"
            render :pre_show
        end
    end
    
    def show
         @item = Item.find(params[:id])
    end
    
    def download
        @item = Item.find(params[:id])
        # @item = Item.find_by!(dl_id: params[:dl_id])
         render :download, layout: false
    end
    
    def not_found
    end
    
    def terms_conditions
    end
    
    def management
        @item = Item.find(params[:id])
    end
    
    def data_list
        @items = Item.includes(:tags).order("id DESC").page(params[:page]).per(50)
    end
    
    def tag_addition
        @item = Item.find(params[:id])
        @item.tags.build(adopt_tag: tag_params[:adopt_tag], item_title: @item.title)
        @item.save
        redirect_to "/items/#{@item.id}/management"
    end
    
    def privacy
    end
    
    def maketag_params
        params.require(:suggests).permit(:suggest_tag)
        # ここに:idをいれるとエラー、しかし入れないと新規レコードして登録されてしまう。。。
    end
    
    def tag_params
        params.require(:tags).permit(:adopt_tag)
    end
    
    def item_params 
        params.require(:item).permit(:title, :cr_item, :dl_item)
    end

end
