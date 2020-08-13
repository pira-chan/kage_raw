class TagsController < ApplicationController
  before_action :move_to_top, :only => [:destroy,]
  def destroy
    @tag = Tag.find(params[:id])
    # @tagが削除される前に関連@itemの情報を取得して、redilect_toを有効にさせる
    @item = @tag.items.last.id    
    @tag.item_tags.destroy_all
    @tag.destroy
    redirect_to "/items/#{@item}/management"
  end
  
  private
  
  def move_to_top
    redirect_to "/" unless user_signed_in? and current_user.admin?
  end
end
