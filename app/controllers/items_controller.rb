class ItemsController < ApplicationController
    
    protect_from_forgery except: :create
    # ↑が無いとタグ投稿時、ときどきInvalidAuthenticityTokenが発生する
    
    def index
        @items =  Item.all.order("id DESC").page(params[:page]).per(15)
    end
    
    def search
    
          
        
        @searched_items = Item.search(params[:search]).order("created_at DESC").page(params[:page]).per(25)
        
        if @searched_items.blank?
          
          redirect_to "/items/not_found"
        end
    end
    
    def show0
        @item = Item.find(params[:id])

    end
    
    
    def maketag

        
        @item = Item.find(params[:id])
        if @item.update(create_params)
        # createはダメだった。。

        InquiryMailer.maketag_email(@item).deliver
        redirect_to "/items/#{@item.id}/show"
        
        else
            flash.now[:hoge] = "１文字以上２０文字以内のタグを入力してください！"
            render :show0
            
            
            
        # render :show
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
    
    def privacy
    end
    
    def create_params
        params.require(:item).permit(:suggest)
        # ここに:idをいれるとエラー、しかし入れないと新規レコードして登録されてしまう。。。
    end
    
    # てすと

end
