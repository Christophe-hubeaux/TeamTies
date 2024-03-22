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

    if @users_games.present?
      @user_scores = Hash.new(0)

      @users_games.each do |user_game|
        @user_scores[user_game.user_id] += user_game.total_score.to_i
      end

      @users_ranking = @user_scores.sort_by { |_user_id, score| -score }.to_h.keys.map { |user_id| [User.find(user_id), @user_scores[user_id]] }
    else
      @users_ranking = []
    end
    @teamranking = teamranking
  end

  private

  def teamranking
    @game = Game.find(params[:id])
    @users_games = @game.users_games
    @users = User.joins(:users_games).where(users_games: { id: @users_games }) # Utilisation de joins pour récupérer les utilisateurs associés aux jeux
    @scores_by_department = Hash.new(0)
    @user_count_by_department = Hash.new(0)

    # Collecter les scores et compter les utilisateurs par département
    @users.each do |user|
      department = user.department.to_sym
      score = user.users_games.sum(:total_score) # Somme des scores pour un utilisateur donné
      @scores_by_department[department] += score
      @user_count_by_department[department] += 1
    end

    # Diviser les scores par le nombre d'utilisateurs dans chaque département
    @scores_by_department.each_key do |department|
      @scores_by_department[department] /= @user_count_by_department[department].to_f
    end

    @sorted_scores_by_department = @scores_by_department.sort.to_h
    @sorted_scores_by_department
  end

  # on itère sur les user_games avec .map
  #  a chaque itération on récupère le user et son score
  # je crée un hash avec en clé le nom du dept (user.dpt) et value les core du user_games
  # [{IT: 3}, {RH: 5}, {IT: 4}]
  # fabriquer un deuxieme hash
  # source = [{IT: 4}, {RH: 4}, {IT: 5}]

  # result = {}

  # source.each do |hash|
  #   hash.each do |key, value|
  #     if result[key]
  #       result[key] += value
  #     else
  #       result[key] = value
  #     end
  #   end
  # end

  def game_params
    params.require(:game).permit(:name)
  end
end
