require 'test_helper'

class ForecastControllerTest < ActionController::TestCase
  test "#index should get index" do
    get :index
    assert_response :success
  end

  test "#index should use index.html" do
    get :index
    assert_template 'forecast/index'
  end

  test "#show should get show" do
    # post :show, {}
    # assert_response :success
  end

  test "#find should redirect" do
    post :find, {}
    assert_response :redirect
  end

  test "#find should redirect to show" do
    post :find, {}
    assert_redirected_to :show
  end
end
