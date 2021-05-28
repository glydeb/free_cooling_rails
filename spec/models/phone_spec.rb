require 'rails_helper'

RSpec.describe User, type: :model do
  let (:phone) { build(:phone) }

  it 'has a valid base factory' do
    expect(phone).to be_valid
  end
end
