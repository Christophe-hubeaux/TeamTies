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
        @matchs_2024_06_22 = Match.where("DATE(date) = ?", Date.parse('2024-06-22'))
        @matchs_2024_06_23 = Match.where("DATE(date) = ?", Date.parse('2024-06-23'))
        @matchs_2024_06_24 = Match.where("DATE(date) = ?", Date.parse('2024-06-24'))
        @matchs_2024_06_25 = Match.where("DATE(date) = ?", Date.parse('2024-06-25'))
        @matchs_2024_06_26 = Match.where("DATE(date) = ?", Date.parse('2024-06-26'))
        @matchs_2024_06_29 = Match.where("DATE(date) = ?", Date.parse('2024-06-29'))
        @matchs_2024_06_30 = Match.where("DATE(date) = ?", Date.parse('2024-06-30'))
        @matchs_2024_07_01 = Match.where("DATE(date) = ?", Date.parse('2024-07-01'))
        @matchs_2024_07_02 = Match.where("DATE(date) = ?", Date.parse('2024-07-02'))
        @matchs_2024_07_05 = Match.where("DATE(date) = ?", Date.parse('2024-07-05'))
        @matchs_2024_07_06 = Match.where("DATE(date) = ?", Date.parse('2024-07-06'))
        @matchs_2024_07_09 = Match.where("DATE(date) = ?", Date.parse('2024-07-09'))
        @matchs_2024_07_10 = Match.where("DATE(date) = ?", Date.parse('2024-07-10'))
        @matchs_2024_07_14 = Match.where("DATE(date) = ?", Date.parse('2024-07-14'))

    end
end
