class Admin::MatchesController < ApplicationController

    def index
        @matches = Match.all
    end
    
    def update
        @match = Match.find(params[:id])
        if @match.update(match_params)
          redirect_to :admin_matches, notice: 'Match mis à jour avec succès.'
          increment = IncrementTotalScore.new(@match)
          increment.updatePronoStatus
        else
          render :edit
        end
    end

    private

    def match_params
        params.require(:match).permit(:home_team_result, :away_team_result)
    end
end
