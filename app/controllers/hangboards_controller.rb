class HangboardsController < ApplicationController

    def index

    end

    def show 

    end 

    def new 

    end 
    
    def create 
    end 

    private 

    def hangboard_params
        params.require(:hangboard).permit(:weight, :date)
    end

end
