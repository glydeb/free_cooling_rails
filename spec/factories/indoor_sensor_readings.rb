FactoryBot.define do
  factory :indoor_sensor_reading do
    timestamp { 15.minutes.ago }
    dry_bulb { 70.0 }
    rh { 50.0 }
    indoor_sensor
  end
end
