require 'rails_helper'

RSpec.describe User, type: :model do
  let (:weather_reading) { build(:weather_reading) }

  it 'has a valid base factory' do
    expect(weather_reading).to be_valid
  end
end
