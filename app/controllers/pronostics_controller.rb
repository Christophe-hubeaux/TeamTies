class PronosticsController < ApplicationController
    def create
        @game = Game.find(params[:game_id])
        @prono = Pronostic.new(prono_params)
        @prono.user = current_user
        @prono.match = Match.find(params[:match_id])
        @date = @prono.match.date.strftime("%d/%m")
        @prono.game = @game
        if @prono.save
            redirect_to game_matches_path(@game, anchor: @date)
        else
            render "matches/index", status: :unprocessable_entity
        end
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
