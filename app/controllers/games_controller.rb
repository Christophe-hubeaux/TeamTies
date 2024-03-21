class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @user_game = UsersGame.create!(user: current_user, game: @game)
    if @game.save
      redirect_to dashboard_game_path(@game), notice: 'La partie a été créée avec succès.'
    else
      render :new
    end
  end

  def dashboard
    @game = Game.find(params[:id])
  end

  def ranking
    @game = Game.find(params[:id])

    @users_games = UsersGame.where(game_id: @game.id)

    @user_scores = {}
    @users_games.each do |user_game|
      user_id = user_game.user_id
      total_score = user_game.total_score
      if @user_scores.key?(user_id)
        @user_scores[user_id] += total_score
      else
        @user_scores[user_id] = total_score
      end
    end
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end
