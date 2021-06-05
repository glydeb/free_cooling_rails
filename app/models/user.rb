class User < ApplicationRecord
  has_many :indoor_sensors
  has_many :phones
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :password_complexity

  def password_complexity
    return if password.blank?

    errors.add :password, I18n.t('users.errors.password_too_short') if password.length < 8
    errors.add :password, I18n.t('users.errors.password_no_number') unless password =~ /[0-9]/
    errors.add :password, I18n.t('users.errors.password_no_uppercase') unless password =~ /[[:upper:]]/
    errors.add :password, I18n.t('users.errors.password_no_lowercase') unless password =~ /[[:lower:]]/
  end
end
