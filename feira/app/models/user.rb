class User < ApplicationRecord
  has_secure_password
  has_many :wish_lists, dependent: :destroy
  has_many :avaliacao_feirantes, dependent: :destroy
  has_many :avaliacao_shopping, dependent: :destroy
  has_one_attached :image

  def coordinates
    return [] unless localizacao
    localizacao.split(",").map(&:to_f)
  end
end
