class PronosticsController < ApplicationController
    def create
        @game = Game.find(params[:game_id])
        @prono = Pronostic.new(prono_params)
        @prono.user = current_user
        @prono.match = Match.find(params[:match_id])
        @prono.game = @game
        @prono.save
    end

    def update
        @game = Game.find(params[:game_id])
        @prono = Pronostic.update(prono_params)
    end

    private

    def prono_params
        params.require(:pronostic).permit(:home_team_prono, :away_team_prono)
    end
end
