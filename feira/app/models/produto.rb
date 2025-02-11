# Represents a product that can be sold at the marketplace. It's linked
# to a vendor (feirante) who sells it and can be added to customers' wish lists.
#
# @attr [Feirante] feirante The vendor who sells this product
# @attr [Array<WishList>] wish_lists Collection of wish lists this product belongs to
class Produto < ApplicationRecord
  belongs_to :feirante
  has_many :wish_lists, dependent: :destroy
  has_one_attached :image
end
