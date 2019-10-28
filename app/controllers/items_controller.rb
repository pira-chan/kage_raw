class ItemsController < ApplicationController
    
    
    def index
        @items =  Item.all.order("id DESC").page(params[:page]).per(12)
    end
    
    def search
    
          
        
        @searched_items = Item.search(params[:search]).order("created_at DESC").page(params[:page]).per(30)
        
        if @searched_items.blank?
          
          redirect_to "/items/not_found"
        end
    end
    
    def show
         @item = Item.find(params[:id])
    end
    
    def download
        
        #  @item = Item.find(params[:title])
         @item = Item.find_by!(dl_id: params[:dl_id])
         render :download, layout: false
    end
    
    def not_found
        
    end
    
    def terms_conditions
        
    end
    
    def privacy
    end

end
