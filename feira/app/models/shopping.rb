class Shopping < ApplicationRecord
  include DistanceCalculator
  has_many :avaliacao_shoppings, dependent: :destroy
  has_many :feirantes, dependent: :destroy
  has_one_attached :image

  def average_rating
    avaliacao_shoppings.average(:nota).to_f.round(2)
  end

  def user_has_reviewed?(user)
    avaliacao_shoppings.exists?(user: user)
  end

  def user_review(user)
    avaliacao_shoppings.find_by(user: user)
  end
  
  def coordinates
    return [] unless localizacao
    localizacao.split(",").map(&:to_f)
  end

  def distance_to(user)
    shop_coords = coordinates
    user_coords = user.coordinates
    return Float::INFINITY if shop_coords.empty? || user_coords.empty?

    DistanceCalculator.haversine_distance(shop_coords, user_coords)
  end
end
