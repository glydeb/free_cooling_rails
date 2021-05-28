FactoryBot.define do
  factory :weather_reading do
    timestamp { 20.minutes.ago }
    dry_bulb { 60.5 }
    rh { 50.0 }
    precip_chance_60 { 4.0 }
    location
  end
end
