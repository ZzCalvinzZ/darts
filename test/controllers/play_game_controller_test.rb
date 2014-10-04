require 'test_helper'

class PlayGameControllerTest < ActionController::TestCase
  test "should get start_game" do
    get :start_game
    assert_response :success
  end

  test "should get end_game" do
    get :end_game
    assert_response :success
  end

end
