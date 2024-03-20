class UsersGamesController < ApplicationController
  def new
    @user = current_user
    @user_game = UsersGame.new
  end

  def create
    @user = current_user
    @game = Game.find_by(code: params[:game][:code])
    @user_game = UsersGame.new(user: @user, game: @game)
    if @user_game.save
      redirect_to dashboard_game_path(@game)
    else 
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_game
    params.require[:game].permit(:code)
  end
end


# @offer = Offer.find(params[:offer_id])