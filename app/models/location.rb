class Location < ApplicationRecord
  has_many :weather_readings
  has_many :indoor_sensors
end
