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
end
