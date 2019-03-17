class AddLastWeatherResultToLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :last_weather_conditions, :text
    add_column :locations, :last_weather_check, :datetime
  end
end
