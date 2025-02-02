class Produto < ApplicationRecord
  belongs_to :feirante
  has_many :wish_lists dependent: :destroy
end