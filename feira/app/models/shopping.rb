class Shopping < ApplicationRecord
  has_many :feirantes, dependent: :destroy

  def coordinates
    return [] unless localizacao
    localizacao.split(',').map(&:to_f)
  end
  
  def distance_to(user)
    shop_coords = coordinates
    user_coords = user.coordinates
    return Float::INFINITY if shop_coords.empty? || user_coords.empty?
    
    # Haversine formula
    rad_per_deg = Math::PI/180
    earth_radius = 6371 # km
    
    dlat = (shop_coords[0] - user_coords[0]) * rad_per_deg
    dlon = (shop_coords[1] - user_coords[1]) * rad_per_deg
    
    a = Math.sin(dlat/2)**2 + Math.cos(user_coords[0] * rad_per_deg) * 
        Math.cos(shop_coords[0] * rad_per_deg) * Math.sin(dlon/2)**2
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    
    earth_radius * c
  end

end
