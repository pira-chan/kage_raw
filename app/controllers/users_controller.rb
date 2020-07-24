class UsersController < ApplicationController
    before_action :move_to_index, :only => [:mypage, :create, :update]
    def mypage
        @user = current_user
        @nickname = current_user.nickname
    end
    
    def create
        @user = current_user
        @user.requests.build(text: request_params[:text],image: request_params[:request_image])
        @user.save
        redirect_to action: 'mypage'
    end
    
    def update
        @user = current_user
        @user.requests.build(request_params)
        @user.save
        redirect_to action: 'mypage'
    end
    

    
    private
    def move_to_index
        redirect_to '/users/sign_in' unless user_signed_in?
    end
    
    def request_params
        params.require(:requests).permit(:text, :request_image)
    end
end
