class User < ApplicationRecord
  has_secure_password
  has_many :wish_lists
  has_one_attached :image

  def coordinates
    return [] unless localizacao
    localizacao.split(",").map(&:to_f)
  end
end
