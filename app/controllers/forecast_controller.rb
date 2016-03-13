class ForecastController < ApplicationController
  def index
  end

  def show
    @city = params[:city]
    @forecasts = Forecast.find_by_name(params[:city])
  end

  def find
    redirect_to action: 'show'
  end
end
