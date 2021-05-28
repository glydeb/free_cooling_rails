require 'rails_helper'

RSpec.describe User, type: :model do
  let (:account) { build(:account) }

  it 'has a valid base factory' do
    expect(account).to be_valid
  end
end
