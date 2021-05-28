require 'rails_helper'

RSpec.describe User, type: :model do
  let (:indoor_sensor) { build(:indoor_sensor) }

  it 'has a valid base factory' do
    expect(indoor_sensor).to be_valid
  end
end
