# Module for calculating geographical distances between coordinates
# using the Haversine formula
module DistanceCalculator
  EARTH_RADIUS = 6371 # km
  RAD_PER_DEG = Math::PI/180

  Coordinates = Struct.new(:lat_rad, :lon_rad) do
    def self.from_degrees(lat, lon)
      new(lat * RAD_PER_DEG, lon * RAD_PER_DEG)
    end
  end

  def self.haversine_distance(origin_coords, destination_coords)
    origin = convert_to_radians(origin_coords)
    destination = convert_to_radians(destination_coords)
    delta = calculate_deltas(origin, destination)
    calculate_final_distance(origin, destination, delta)
  end

  private

  def self.convert_to_radians(coords)
    lat, lon = coords
    Coordinates.from_degrees(lat, lon)
  end

  def self.calculate_deltas(origin, destination)
    Coordinates.new(
      destination.lat_rad - origin.lat_rad,
      destination.lon_rad - origin.lon_rad
    )
  end

  def self.calculate_final_distance(origin, destination, delta)
    haversine_half = Math.sin(delta.lat_rad/2)**2 +
                     Math.cos(destination.lat_rad) *
                     Math.cos(origin.lat_rad) *
                     Math.sin(delta.lon_rad/2)**2
    central_angle = 2 * Math.atan2(Math.sqrt(haversine_half), Math.sqrt(1-haversine_half))
    EARTH_RADIUS * central_angle
  end
end
