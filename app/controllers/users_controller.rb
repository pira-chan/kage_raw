class UsersController < ApplicationController
    before_action :move_to_index, :only => [:mypage, :create, :update]
    # def mypage 現在使用中止
    #     @user = current_user
    #     @nickname = current_user.nickname
    # end
    
end
