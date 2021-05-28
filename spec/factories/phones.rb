FactoryBot.define do
  factory :phone do
    phone_number { '867-5309' }
    alertable { true }
    enable_alert_at_mins_after_midnight { 420 }
    disable_alert_at_mins_after_midnight { 1380 }
    user
  end
end
