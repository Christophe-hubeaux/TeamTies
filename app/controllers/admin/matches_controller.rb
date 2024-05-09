class Admin::MatchesController < ApplicationController

    def index
        @matches = Match.all
    end
    
    def new
      @match = Match.new
    end

    def create
      @match = Match.new(match_params)
      if @match.save
        redirect_to admin_matches_path, notice: 'Match créé avec succès'
      else
        render :new
      end
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
