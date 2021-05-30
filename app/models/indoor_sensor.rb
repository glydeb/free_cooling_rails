class IndoorSensor < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_many :indoor_sensor_readings
end
