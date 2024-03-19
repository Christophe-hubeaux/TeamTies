class GamesController < ApplicationController
    def new
        @game = Game.new
    end

    def create
        @game = Game.new(game_params)
        if @game.save
          redirect_to dashboard_game_path(@game), notice: 'La partie a été créée avec succès.'
        else
          render :new
        end
    end
    
    def dashboard
        @game = Game.find(params[:id])
    end

    private
    
    def game_params
        params.require(:game).permit(:name)
    end

end
