require 'test_helper'

class BrainyControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get eugene" do
    get :eugene
    assert_response :success
  end

end
