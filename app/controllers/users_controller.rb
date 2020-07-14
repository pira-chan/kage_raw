class UsersController < ApplicationController
    
    def mypage
        @nickname = current_user.nickname
    end
    
end
