class SendsController < ApplicationController
    before_action :set_send, only: [:show, :edit, :update, :destroy]
    def index
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])
            @sends = @user.sends
        else 
            @sends = Send.all
        end
    end
    
    
    def show 
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

    def edit 
        unless @send.user == current_user
            flash[:alert] = "You can only edit your own send"
            redirect_to root_path
        end

    end

    def update 
        @send.update(send_params)
        if @send.save
            redirect_to user_send_path(@send.user, @send)
        else 
            render :edit
        end
    end

    def destroy 
        if @send.user == current_user
            @send.destroy 
            flash[:alert] = "Send Successfully Deleted."
        else
            flash[:alert] = "You cannot delete a Send that does not belong to you." 
        end
        redirect_to root_path
    end

    private 

    def set_send 
        @send = Send.find_by_id(params[:id])
    end

    def send_params
        params.require(:send).permit(:climb_id, :attempts, :description)
    end
end
