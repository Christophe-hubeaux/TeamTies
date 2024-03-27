require "byebug"

class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    # @user_game = UsersGame.create!(user: current_user, game: @game, department: nil)
    # @organisator = User.find(user: current_user)
    @game.code = SecureRandom.urlsafe_base64(10)
    if @game.save
      Chat.create(name: @game.name, game: @game) # Créer un chat associé au jeu
      session[:game_code] = @game.code # Stocker le code dans la session
      redirect_to edit_organisateur_game_path(@game), notice: 'La partie a été créée avec succès.'
    else
      render :new
    end
  end

  def dashboard
    @dashboard = true
    @game = Game.find(params[:id])
    @department = UsersGame.find_by(user: current_user, game: @game).department
    if Match.exists?(params[:id])
      @match = Match.find(params[:id])
    else
      # donner une valeur par défaut:
      @match = Match.new
    end

    @dashboard_individual_rankings = UsersGame.joins(:user, :game, :department)
                                              .select('games.name, departments.name as team, users.pseudo, SUM(users_games.total_score) as total_score')
                                              .group('games.name, users.id, team', )
                                              .order('total_score DESC')
                                              .limit(3)

    @dashboard_department_rankings = UsersGame.joins(:user, :department)
                                         .select('departments.name as team, AVG(users_games.total_score) as average_score')
                                         .group('team')
                                         .order('average_score DESC')
                                         .limit(3)

    @next_three_matches = Match.where("date > ?", Date.today).order(:date).limit(3).map do |match|
      prono = Pronostic.find_by(match: match, user: current_user)
      [match, prono]
    end
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

  def join
    game_code = params[:code]
    session[:game_code] = game_code
    game = Game.find_by(code: params[:code])
    if game
      UsersGame.create(user: current_user, game: game)
      redirect_to dashboard_game_path(game), notice: 'Bienvenue! Vous avez bien rejoint la partie!'
    else
      redirect_to root_path, alert: 'Code Invalide.'
    end
  end

  def check_code
    @game = Game.find_by(code: params[:code])
    if @game
      flash[:notice] = "Le code du jeu est valide."
      redirect_to new_game_users_game_path(@game)
    end
  end

  private

  def teamranking
    @game = Game.find(params[:id])
    @users_games = @game.users_games
    @users = User.joins(:users_games).where(users_games: { id: @users_games }) # Utilisation de joins pour récupérer les utilisateurs associés au jeu
    @scores_by_department = Hash.new(0)
    @user_count_by_department = Hash.new(0)
    # Collecter les scores et compter les utilisateurs par département
    @users_games.each do |user_game|
      # department = user.users_games.department.to_sym
      department = user_game.department.name
      score = user_game.total_score # Somme des scores pour un utilisateur donné
      @scores_by_department[department] += score
      @user_count_by_department[department] += 1
    end
    # Diviser les scores par le nombre d'utilisateurs dans chaque département
    @scores_by_department.each_key do |department|
      @scores_by_department[department] /= @user_count_by_department[department].to_f
    end
    # Trier les scores par département en fonction de la moyenne (du plus haut au plus bas)
    @sorted_scores_by_department = @scores_by_department.sort_by { |department, score| -score }.to_h
  end

  def game_params
    params.require(:game).permit(:name, :user_id)
  end
end
