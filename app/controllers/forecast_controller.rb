class ForecastController < ApplicationController
  def index
  end

  def show
  end

  def find
    redirect_to action: 'show'
  end
end
