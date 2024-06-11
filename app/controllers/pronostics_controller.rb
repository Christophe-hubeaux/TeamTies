class PronosticsController < ApplicationController
    def create
        @game = Game.find(params[:game_id])
        @match = Match.find(params[:match_id])
        @date = @match.date.strftime("%d/%m")
        @prono = Pronostic.find_or_initialize_by(user: current_user, match: @match, game: @game)
        @prono.assign_attributes(prono_params)

        # @prono = Pronostic.new(prono_params)
        # @prono.user = current_user
        # @prono.match = Match.find(params[:match_id])
        # @date = @prono.match.date.strftime("%d/%m")
        @prono.game = @game
        if @prono.save && @prono.match.stage == 'phase de groupes'
            # redirect_to game_matches_path(@game, anchor: @date)
        # elsif @prono.save
        else
            render "matches/index", status: :unprocessable_entity
        end
    end

    def update
        @game = Game.find(params[:game_id])
        @match = Match.find(params[:match_id])
        @prono = Pronostic.where(match_id: @match, game_id: @game, user_id: current_user)
        @prono.update(prono_params)
    end

    private

    def prono_params
        params.require(:pronostic).permit(:home_team_prono, :away_team_prono)
    end
end
