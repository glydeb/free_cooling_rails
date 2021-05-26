require 'rails_helper'

RSpec.describe User, type: :model do
  let (:expected_error) { { email: [I18n.t('activerecord.errors.models.user.attributes.email.invalid')] } }
  let (:user) { build(:user) }

  it 'has a valid base factory' do
    user.save
    expect(user).to be_valid
  end

  describe 'email format validation' do
    it 'will not allow a email address without a domain' do
      user = build(:user, email: 'nodomain@')
      expect(user).to be_invalid
      expect(user.errors.messages).to eq(expected_error)
    end

    it 'will not allow a email address without an "@" symbol' do
      user = build(:user, email: 'noatgoogle.com')
      expect(user).to be_invalid
      expect(user.errors.messages).to eq(expected_error)
    end

    it 'will not allow a email address without a mailbox' do
      user = build(:user, email: '@gmail.com')
      expect(user).to be_invalid
      expect(user.errors.messages).to eq(expected_error)
    end

    it 'will not allow a email address with more than one "@" symbol' do
      user = build(:user, email: 'twoats@2@gmail.com')
      expect(user).to be_invalid
      expect(user.errors.messages).to eq(expected_error)
    end
  end

  describe 'password complexity validation -' do
    context 'password too short' do
      it 'fails validation with correct message' do
        user.password = '1234AaB'
        expect(user).to be_invalid
        user.save
        expect(user.errors.messages[:password]).to include(I18n.t('users.errors.password_too_short'))
      end
    end

    context 'password does not contain a number' do
      it 'fails validation with correct message' do
        user.password = 'Abcdefgh'
        expect(user).to be_invalid
        user.save
        expect(user.errors.messages[:password]).to include(I18n.t('users.errors.password_no_number'))
      end
    end

    context 'password does not contain a lowercase letter' do
      it 'fails validation with correct message' do
        user.password = '123456A'
        expect(user).to be_invalid
        user.save
        expect(user.errors.messages[:password]).to include(I18n.t('users.errors.password_no_letter'))
      end
    end

    context 'password does not contain an uppercase letter' do
      it 'fails validation with correct message' do
        user.password = '123456a'
        expect(user).to be_invalid
        user.save
        expect(user.errors.messages[:password]).to include(I18n.t('users.errors.password_no_letter'))
      end
    end

    context 'password meets standards' do
      it 'fails validation with correct message' do
        user.password = '123456Aa'
        expect(user).to be_valid
        expect do
          user.save
        end.to_change(User.all, :size).by(1)
      end
    end
  end
end
