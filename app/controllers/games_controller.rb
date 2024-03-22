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

    if Match.exists?(params[:id])
      @match = Match.find(params[:id])
    else
      # donner une valeur par défaut:
      @match = Match.new
      # redirect_to root_path
    end

    @dashboard_individual_rankings = UsersGame.joins(:game, :user)
                         .select('games.name, users.pseudo, users_games.total_score')
                         .order(total_score: :desc)
                         .limit(3)
    @dashboard_collective_rankings = UsersGame.joins(:game)
                         .select('games.name, users_games.total_score')
                         .order(total_score: :desc)
                         .limit(3)
  end

  def ranking
    @game = Game.find(params[:id])

    @users_games = UsersGame.where(game_id: @game.id)

    if @users_games.present?
      @user_scores = Hash.new(0)

      @users_games.each do |user_game|
        @user_scores[user_game.user_id] += user_game.total_score.to_i
      end

      @users_ranking = @user_scores.sort_by { |_user_id, score| -score }.to_h.keys.map { |user_id| [User.find(user_id), @user_scores[user_id]] }
    else
      @users_ranking = []
    end
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end
