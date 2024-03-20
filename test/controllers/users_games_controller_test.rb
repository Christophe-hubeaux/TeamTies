require "test_helper"

class UsersGamesControllerTest < ActionDispatch::IntegrationTest
  test "should get :new" do
    get users_games_:new_url
    assert_response :success
  end

  test "should get :create" do
    get users_games_:create_url
    assert_response :success
  end
end
