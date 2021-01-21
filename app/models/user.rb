class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 3 }
  has_secure_password
  has_many :todos
end
