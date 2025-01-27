class Feirante < ApplicationRecord
  has_secure_password
  belongs_to :shopping
  has_many :produtos, dependent: :destroy
end