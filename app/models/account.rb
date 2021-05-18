class Account < ApplicationRecord
  has_many :users
  has_many :indoor_sensors
end
