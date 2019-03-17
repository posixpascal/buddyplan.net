class LocationWeatherJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Location.order(last_weather_check: :asc).limit(30).each do |location|
      location.fetch_weather
    end
  end
end
