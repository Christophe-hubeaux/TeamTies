class Organisateur::DepartmentsController < ApplicationController
    
    def create
        @game = Game.find(params[:game_id])
        @department = Department.new(department_params)
        @department.game = @game
        if @department.save
            redirect_to edit_organisateur_game_path(@game)
        else
            render "edit", status: :unprocessable_entity
        end
    end

    private

    def department_params
        params.require(:department).permit(:name)
    end
end
