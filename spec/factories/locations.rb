FactoryBot.define do
  factory :location do
    sequence(:street_address) { |n| "location #{n} street address" }
    sequence(:city) { |n| "location #{n} city" }
    sequence(:state) { |n| "location #{n} state" }
    sequence(:zip) { |n| "location #{n} zip" }
    latitude { 45.0 }
    longitude { 93.0 }
  end
end
