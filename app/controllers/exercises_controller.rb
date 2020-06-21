class ExercisesController < ApplicationController
    before_action :set_exercise
    
    def edit 
        @holds = HOLDS
    end

    def update 
        @exercise.update(exercise_params)
        if @exercise.save
            redirect_to edit_hangboard_path(@exercise.hangboard)
        else 
            render :edit 
        end
    end

    def delete

    end

    private
    def set_exercise 
        @exercise = Exercise.find_by_id(params[:id])
        
    end

    def exercise_params
        params.require(:exercise).permit(:weight, :reps, :hold, :difficulty)
    end
end
