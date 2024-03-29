class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @user_game = UsersGame.find_by(user: current_user)
    @game = @user_game.game unless @user_game.nil?
  end
end
