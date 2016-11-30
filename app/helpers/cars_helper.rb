module CarsHelper
  def self.distance(car, officer)
    return CarsHelper.dist_helper car.lat, car.long, officer.lat, officer.long
  end

  def self.dist_helper(lat1, lon1, lat2, lon2)
    radlat1 = Math::PI * lat1 / 180
    radlat2 = Math::PI * lat2 / 180
    theta = lon1 - lon2
    radtheta = Math::PI * theta / 180
    dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta)
    dist = Math.acos(dist)
    dist = dist * 180 / Math::PI
    dist = dist * 60 * 1.1515
    return dist
  end

  def cache_key_for_car_row(car)
    "#{car.id}-#{car.user_id}"
  end
end
