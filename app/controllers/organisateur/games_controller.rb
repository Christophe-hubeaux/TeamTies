class Organisateur::GamesController < ApplicationController

  def edit
    @game = Game.find(params[:id])
    @game_departments = Department.where(game: @game)
    @department = Department.new
  end
end
