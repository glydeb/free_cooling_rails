FactoryBot.define do
  factory :account do
    owner_id { nil }
    sequence(:name) { |n| "test account #{n}" }
  end
end
