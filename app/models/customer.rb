class Customer < ApplicationRecord
  validates :username, :email, presence: true, uniqueness: true
  attribute :active_flag, default: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password, format: { with: /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}\z/ }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ }
end
