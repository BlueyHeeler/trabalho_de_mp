# Class representing a vendor/merchant in a shopping center.
# This class manages vendor information and their relationships.
#
#
# Associations:
# - Belongs to a shopping center
# - Has many products that are dependent on vendor (will be destroyed if vendor is deleted)
#
# Security:
# - Implements secure password functionality through has_secure_password
class Feirante < ApplicationRecord
  has_secure_password
  belongs_to :shopping
  has_many :produtos, dependent: :destroy
  has_many :avaliacao_feirantes, dependent: :destroy
  has_one_attached :image

  def average_rating
    avaliacao_feirantes.average(:nota).to_f.round(2)
  end

  def user_has_reviewed?(user)
    avaliacao_feirantes.exists?(user: user)
  end

  def user_review(user)
    avaliacao_feirantes.find_by(user: user)
  end
end
