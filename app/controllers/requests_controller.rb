class RequestsController < ApplicationController
    # ここはリクエスト写真のテストコントローラ
    def new
        @requests = Request.all
        @request = Request.new
    end
    
    def create
        @request = Request.new(request_params)
        @request.save
        redirect_to action: 'new'
    end
    
    private
    def request_params
        params.require(:request).permit(:image)
    end
end
    