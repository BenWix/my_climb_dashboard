class UsersController < ApplicationController
    def show 
        # binding.pry
        @user = current_user
    end
end
