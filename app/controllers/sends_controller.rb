class SendsController < ApplicationController
    def index
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])
            @sends = @user.sends
        else 
            @sends = Send.all
        end
    end
    
    
    def show 
        @send = Send.find_by_id(params[:id])
    end

    def new 
        if current_user 
            @send = Climb.find_by_id(params[:climb_id]).sends.build
        else 
            redirect_to root_path
        end
    end

    def create 
        @send = current_user.sends.build(send_params)
        if @send.save 
            redirect_to user_send_path(@send.user, @send)
        else 
            render :new
        end
    end

    private 

    def send_params
        params.require(:send).permit(:climb_id, :attempts, :description)
    end
end
