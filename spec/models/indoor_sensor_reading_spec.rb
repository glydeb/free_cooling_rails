require 'rails_helper'

RSpec.describe User, type: :model do
  let (:indoor_sensor_reading) { build(:indoor_sensor_reading) }

  it 'has a valid base factory' do
    expect(indoor_sensor_reading).to be_valid
  end
end
