require 'rails_helper'

RSpec.describe User, type: :model do
  let (:location) { build(:location) }

  it 'has a valid base factory' do
    expect(location).to be_valid
  end
end
