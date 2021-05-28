require 'rails_helper'

RSpec.describe User, type: :model do
  let (:recommendation) { build(:recommendation) }

  it 'has a valid base factory' do
    expect(recommendation).to be_valid
  end
end
