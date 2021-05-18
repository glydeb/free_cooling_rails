class Recommendation < ApplicationRecord
  belongs_to :indoor_sensor
  belongs_to :weather_reading
end
