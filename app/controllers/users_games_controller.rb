class UsersGamesController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @user = current_user
    @user_game = UsersGame.new
    @game_departments = @game.departments.pluck(:name)
  end

  def create
    @user = current_user
    @game = Game.find(params[:game_id])
    @user_game = UsersGame.new(department: Department.find_by(name: user_game_params[:department]))
    @user_game.game = @game
    @user_game.user = @user
    @user_game.total_score = 0
    unless UsersGame.where(game: @game).any?
      @user_game.owner = true
    end
    if @user_game.save
      redirect_to dashboard_game_path(@game)
    else 
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_game_params
    params.require(:users_game).permit(:department)
  end
end