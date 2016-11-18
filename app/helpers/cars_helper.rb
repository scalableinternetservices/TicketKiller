module CarsHelper
  def self.distance(car, officer)
    return CarsHelper.dist_helper car.long, car.lat, officer.long, officer.lat
  end

  def self.dist_helper(car_long, car_lat, officer_long, officer_lat)
    #haversine
    car_long_rad = car_long * Math::PI / 180
    car_lat_rad = car_lat * Math::PI / 180
    officer_long_rad = officer_long * Math::PI / 180
    officer_lat_rad = officer_lat * Math::PI / 180

    dLat = officer_lat_rad - car_lat_rad
    dLon = officer_long_rad - car_long_rad
    a = 
    Math.sin(dLat/2) * Math.sin(dLat/2) +
    Math.cos(car_lat_rad) * Math.cos(officer_lat_rad) * 
    Math.sin(dLon/2) * Math.sin(dLon/2)
     
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)) 
    d = 6371 * c
    return d;
  end
  
end
