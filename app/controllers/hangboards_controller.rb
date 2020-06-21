class HangboardsController < ApplicationController
    before_action :set_hangboard, only: [:edit, :update, :delete, :show]
    def index
        if params[:user_id]
            @hangboards = User.find_by_id(params[:user_id]).hangboards
        else 
            @hangboards = Hangboard.all
        end
    end

    def show 
    end 

    def new 
        unless User.find_by_id(params[:user_id]) == current_user
            flash[:alert] = "You can only log hangboard workouts for your own account"
            redirect_to root_path
        end
        @hangboard = current_user.hangboards.build
        @holds = HOLDS
    end 
    
    def create 
        @hangboard = Hangboard.new(hangboard_params)
        if @hangboard.save
            redirect_to user_hangboards_path(@hangboard.user)
        else 
            render :new
        end
    end 

    def edit 

    end

    def update 
        @hangboard.update(hangboard_update_params)
        if @hangboard.save
            redirect_to user_hangboards_path(@hangboard.user)
        else
            render :edit
        end
    end

    def delete 

    end



    private 

    def set_hangboard 
        @hangboard = Hangboard.find_by_id(params[:id])
    end


    def hangboard_params
        params.require(:hangboard).permit(:weight, :date, :user_id, exercises_attributes: [
            :hold, :reps, :difficulty, :weight
        ])
    end

    def hangboard_update_params
        params.require(:hangboard).permit(:weight, :date)
    end

end
