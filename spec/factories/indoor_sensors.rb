FactoryBot.define do
  factory :indoor_sensor do
    sequence(:device_id) { |n| "device #{n} id" }
    sequence(:device_hash) { |n| "device #{n} hash" }
    location
    sequence(:access_token) { |n| "device #{n} access_token" }
    sequence(:name) { |n| "device #{n} name" }
    user
  end
end
