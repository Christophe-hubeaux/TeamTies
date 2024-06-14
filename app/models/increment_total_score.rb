class IncrementTotalScore < ApplicationRecord
    
    def initialize(match)
        @match = match
    end

    def updatePronoStatus
        # if @match.stage == "finale"

        # else 
            @pronos = Pronostic.where(match_id: @match, home_team_prono: 0..99, away_team_prono: 0..99)    
            @pronos.each do |prono|
                if (@match.home_team_result == prono.home_team_prono) && (@match.away_team_result == prono.away_team_prono)
                    prono.status = "bonus"
                elsif ((@match.home_team_result > @match.away_team_result) && (prono.home_team_prono > prono.away_team_prono)) || ((@match.home_team_result == @match.away_team_result) && (prono.home_team_prono == prono.away_team_prono)) || ((@match.home_team_result < @match.away_team_result) && (prono.home_team_prono < prono.away_team_prono))
                    prono.status = "win"
                else
                    prono.status = "lose"
                end
                prono.save
                userGame = UsersGame.find_by(user_id: prono.user_id, game_id: prono.game_id)
                if userGame
                    if prono.status == "bonus"
                        userGame.total_score += 3
                    elsif prono.status == "win"
                        userGame.total_score += 1
                    end
                    userGame.save
                end
            end
            # addScore
        # end
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

    def matchWinner
        if (@match.home_team_result > @match.away_team_result)
            @match.winner_id = @match.home_team_id
        elsif (@match.home_team_result < @match.away_team_result)
            @match.winner_id = @match.away_team_id
        else 
            @match.winner_id = nil
        end
        @match.save
    end

    def finalWinner
        # called if last game (final)
        #  find all prono with team = winner team
        @rightFinalPronos = UsersGame.where(final_winner_id: @match.winner_id)
        @rightFinalPronos.each do |usergame|
            usergame.total_score += 10
            usergame.save
        end
    end
end
