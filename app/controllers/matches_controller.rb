class MatchesController < ApplicationController
    def index
        @game = Game.find(params[:game_id])
        @matchs = Match.all
        @user = current_user
        @pronos = Pronostic.where(user: current_user, game: @game )
        @prono = Pronostic.new
        @matchs_2024_06_14 = Match.where("DATE(date) = ?", Date.parse('2024-06-14'))
        @matchs_2024_06_15 = Match.where("DATE(date) = ?", Date.parse('2024-06-15'))
        @matchs_2024_06_16 = Match.where("DATE(date) = ?", Date.parse('2024-06-16'))
        @matchs_2024_06_17 = Match.where("DATE(date) = ?", Date.parse('2024-06-17'))
        @matchs_2024_06_18 = Match.where("DATE(date) = ?", Date.parse('2024-06-18'))
        @matchs_2024_06_19 = Match.where("DATE(date) = ?", Date.parse('2024-06-19'))
        @matchs_2024_06_20 = Match.where("DATE(date) = ?", Date.parse('2024-06-20'))
        @matchs_2024_06_21 = Match.where("DATE(date) = ?", Date.parse('2024-06-21'))
        @matchs_2024_06_22 = Match.where("DATE(date) = ?", Date.parse('2024-06-21'))
    end
end
