class Customer < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /[a-z]*@[a-z]*\.[a-z]{2,3}/ }
  validates :password, presence: true
  validates :password, format: { with: /[A-Za-z0-9]{6,}/ }
end
