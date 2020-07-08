class TagsController < ApplicationController
    
    
    def destroy
        
        @tag = Tag.find(params[:id])
        @item = @tag.items.last.id
        @tag.item_tags.destroy_all
        @tag.destroy
        
        redirect_to "/items/#{@item}/management"
    end
    
end
