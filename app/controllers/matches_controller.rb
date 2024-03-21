class MatchesController < ApplicationController
    def index
        @game = Game.find(params[:game_id])
        @matchs = Match.all
        @user = current_user
        @pronos = Pronostic.where(user_id: current_user)
        @prono = Pronostic.new
        @matchs_2024_06_14 = Match.where(date: '2024-06-14')
        @matchs_2024_06_15 = Match.where(date: '2024-06-15')
        @matchs_2024_06_16 = Match.where(date: '2024-06-16')
        @matchs_2024_06_17 = Match.where(date: '2024-06-17')
        @matchs_2024_06_18 = Match.where(date: '2024-06-18')
        @matchs_2024_06_19 = Match.where(date: '2024-06-19')
        @matchs_2024_06_20 = Match.where(date: '2024-06-20')
    end

end
