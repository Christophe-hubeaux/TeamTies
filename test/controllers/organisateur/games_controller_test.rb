require "test_helper"

class Organisateur::GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get organisateur_games_edit_url
    assert_response :success
  end
end
