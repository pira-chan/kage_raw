class RequestsController < ApplicationController

    def new #リクエスト投稿画面
        @nickname = current_user.nickname
        @requests = Request.all
        @request = Request.new
    end
    
    def create #リクエスト投稿保存処理
        if user_signed_in?
            # @request = Request.new(request_params)
            # Request.create(request_params)
            # @request = current_user.requests.build(name: request_params[:name])
            # @request.image.attach(request_params[:image])
            # @request = Request.current_user.build(request_params)
            @request = current_user.requests.build(request_params)
            @request.save
            redirect_to action: 'new'
        end
    end
    
    private
    
    def request_params
        params.require(:request).permit(:image, :name)
        # params.require(:request).permit(:name)
    end
end
    
