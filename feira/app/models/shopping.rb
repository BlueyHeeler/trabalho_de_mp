class Shopping < ApplicationRecord
  include DistanceCalculator

  has_many :feirantes, dependent: :destroy

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
