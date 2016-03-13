require 'test_helper'
require 'fixtures/forecast_fixture'

class ForecastTest < ActiveSupport::TestCase
  test "#find_by_name with nil name returns empy list" do
    assert [] == Forecast.find_by_name(nil)
  end

  test "#find_by_name with empty name returns empy list" do
    assert [] == Forecast.find_by_name("")
  end

  test "#find_by_name success should return city name" do
    Forecast.expects(:request).returns(ForecastFixture.response)
    response = Forecast.find_by_name("test")
    assert "London" == response["city"]["name"]
  end

  test "#find_by_name should return one forecast" do
    Forecast.expects(:request).returns(ForecastFixture.response)
    response = Forecast.find_by_name("test")
    assert 1 == response["list"].length
  end
end
