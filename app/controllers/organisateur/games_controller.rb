class Organisateur::GamesController < ApplicationController

  def edit
    @game = Game.find(params[:id])
    @game_departments = Department.where(game: @game)
    @department = Department.new
    @game_users = UsersGame.where(game: @game)
    @users = @game_users.map(&:user)
  end
end
