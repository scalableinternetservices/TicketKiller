module CarsHelper
  def self.distance(car, officer)
    return CarsHelper.dist_helper car.lat, car.long, officer.lat, officer.long
  end

  # def self.dist_helper(car_long, car_lat, officer_long, officer_lat)
  #   #haversine
  #   car_long_rad = car_long * Math::PI / 180
  #   car_lat_rad = car_lat * Math::PI / 180
  #   officer_long_rad = officer_long * Math::PI / 180
  #   officer_lat_rad = officer_lat * Math::PI / 180

  #   dLat = officer_lat_rad - car_lat_rad
  #   dLon = officer_long_rad - car_long_rad
  #   a = 
  #   Math.sin(dLat/2) * Math.sin(dLat/2) +
  #   Math.cos(car_lat_rad) * Math.cos(officer_lat_rad) * 
  #   Math.sin(dLon/2) * Math.sin(dLon/2)
     
  #   c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)) 
  #   d = 6371 * c
  #   return d;
  # end

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
  
  
end
