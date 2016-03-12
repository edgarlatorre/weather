require 'test_helper'

class ForecastTest < ActiveSupport::TestCase
  test "#find_by_name with nil name returns empy list" do
    assert [] == Forecast.find_by_name(nil)
  end

  test "#find_by_name with empty name returns empy list" do
    assert [] == Forecast.find_by_name("")
  end

  test "#find_by_name success should return city name" do
    Forecast.expects(:request).returns(response)
    response = Forecast.find_by_name("test")
    assert "London" == response["city"]["name"]
  end

  test "#find_by_name should return one forecast" do
    Forecast.expects(:request).returns(response)
    response = Forecast.find_by_name("test")
    assert 1 == response["list"].length
  end

  private
  def response
    "{\"city\":{\"id\":2643743,\"name\":\"London\",\"coord\":{\"lon\":-0.12574,\"lat\":51.50853},\"country\":\"GB\",\"population\":0},\"cod\":\"200\",\"message\":0.0165,\"cnt\":1,\"list\":[{\"dt\":1457784000,\"temp\":{\"day\":6.81,\"min\":-1.99,\"max\":6.81,\"night\":-1.99,\"eve\":4.42,\"morn\":6.81},\"pressure\":1037.33,\"humidity\":87,\"weather\":[{\"id\":802,\"main\":\"Clouds\",\"description\":\"scattered clouds\",\"icon\":\"03d\"}],\"speed\":2.06,\"deg\":159,\"clouds\":36}]}"
  end
end
