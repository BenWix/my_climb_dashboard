class ClimbsController < ApplicationController
    before_action :set_climb, only: [:show]
    
    def index 
        @climbs = Climb.all
    end
    
    def show 
        
    end

    def new 
        unless current_user.admin
            redirect_to root_path
        end
        @grades = GRADES
        @climb_style = CLIMB_STYLES
        @climb = Climb.new
    end

    def create 
        @climb = Climb.new(climb_params)
        if @climb.save
            redirect_to climbs_path
        else
            render :new
        end
    end

    private 

    def climb_params 
        params.require(:climb).permit(:name, :grade, :climb_style)
    end

    def set_climb
        @climb = Climb.find_by_id(params[:id])
    end
end
