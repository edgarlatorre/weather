class Forecast
  API_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?"

  def self.find_by_name(name, limit=16)
    response = []

    unless name.nil? or name.empty?
      query = "q=#{name}&mode=json&units=metric&cnt=#{limit}"
      response = request(query)

      if response
        response = JSON.parse(response)
      end
    end

    return response
  end

  private
  def self.request(query)
    url = "#{self::API_URL}#{query}&appid=#{ENV['OPEN_WEATHER_KEY']}"
    result = Net::HTTP.get(URI.parse(url))
  end
end
