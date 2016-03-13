require 'test_helper'

class ForecastSearchTest < ActionDispatch::IntegrationTest
  test "search for a forecast weather to Dublin" do
    get "/"
    assert_response :success

    post "/show", city: "Dublin"
    assert assigns(:forecasts)
    assert assigns(:city)
  end
end
