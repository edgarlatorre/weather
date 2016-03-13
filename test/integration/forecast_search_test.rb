require 'test_helper'
require 'fixtures/forecast_fixture'

class ForecastSearchTest < ActionDispatch::IntegrationTest
  test "search for a forecast weather to Dublin" do
    get "/"
    assert_response :success

    Forecast.expects(:request).returns(ForecastFixture.response)
    post "/show", city: "Dublin"
    assert assigns(:forecasts)
    assert assigns(:city)
  end
end
