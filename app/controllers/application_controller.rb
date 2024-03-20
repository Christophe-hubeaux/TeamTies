class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:pseudo, :department, :avatar])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:pseudo, :department, :avatar])
  end

  def after_sign_in_path_for(resource)
    root_path()
  end
end

# @user = current_user
# @user_game = UsersGame.find_by(user_id: @user)
# if @user_game != nil
#   @game = @user_game.game
#   dashboard_game_path(@game)
# end
