class IncrementTotalScore < ApplicationRecord
    
    def initialize(match)
        @match = match
    end

    def updatePronoStatus
        @pronos = Pronostic.where(match_id: @match)        
        @pronos.each do |prono|
            if (@match.home_team_result == prono.home_team_prono) && (@match.away_team_result == prono.away_team_prono)
                prono.status = "bonus"
            elsif ((@match.home_team_result > @match.away_team_result) && (prono.home_team_prono > prono.away_team_prono)) || ((@match.home_team_result == @match.away_team_result) && (prono.home_team_prono == prono.away_team_prono)) || ((@match.home_team_result < @match.away_team_result) && (prono.home_team_prono < prono.away_team_prono))
                prono.status = "win"
            else
                prono.status = "lose"
            end
            prono.save
        end
        addScore
    end

    def addScore
        @pronos = Pronostic.where(match_id: @match)        
        @winingPronos = @pronos.where("status = ? OR status = ?", "bonus", "win")
        @winingPronos.each do |prono|
            @userGame = UsersGame.find_by(user_id: prono.user_id, game_id: prono.game_id)
            if prono.status == "bonus"
                @userGame.total_score += 3
            else
                @userGame.total_score += 1
            end
            @userGame.save
        end
    end

end
