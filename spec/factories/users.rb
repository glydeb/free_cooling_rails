FactoryBot.define do
  factory :user do
    email { 'sample@example.com' }
    password { 'Password1' }
    account_id { nil }

    after(:build) do |user|
      user.account_id = create(:account).id if user.account_id.blank?
    end

    after(:create) do |user|
      byebug
      if user.account.owner_id.blank?
        user.account.owner_id = user.id 
        user.account.save
      end
    end
  end
end
