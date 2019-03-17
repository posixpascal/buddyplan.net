class Location < ApplicationRecord
  belongs_to :movie
  belongs_to :user, optional: true
  serialize :last_weather_conditions


  def fetch_weather
    return false unless lat and lng

    require "net/http"

    url = "https://api.darksky.net/forecast/#{Rails.application.credentials.dark_sky_api_key}/#{lat},#{lng}?lang=de&units=si"
    resp = Net::HTTP.get_response(URI.parse(url))

    @weather_conditions = JSON.parse(resp.body)

    self.last_weather_check = Time.zone.now
    self.last_weather_conditions = @weather_conditions
    save
  end
end
