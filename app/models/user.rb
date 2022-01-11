# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password # метод защиты пароля, по умолчанию работает с password

  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy

  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true
  validates :name, presence: true, uniqueness: true, length: { minimum: 5 }

  validate :password_complexity

  private

  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{2,70}$/

    errors.add :password,
               'Complexity requirement not met. Length should be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end
end
