FactoryBot.define do
  factory :recommendation do
    timestamp { 15.minutes.ago }
    free_cooling_available { true }
    indoor_sensor
    weather_reading 
  end
end
