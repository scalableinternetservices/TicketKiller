module CarsHelper
  def dist (car_long, car_lat, officer_long, officer_lat)
    # haversine
    car_long_rad = car_long * Math::PI / 180
    car_lat_rad = car_lat * Math::PI / 180
    officer_long_rad = officer_long * Math::PI / 180
    officer_lat_rad = officer_lat * Math::PI / 180

    dlong = officer_long_rad - car_long_rad
    dlat  = officer_lat_rad  - car_lat_rad

    a = (Math.sin (dlong/2))**2 +
        (Math.cos car_lat_rad) * (Math.cos officer_lat_rad) *
        (Math.sin (dlat/2))**2

    6_367_000 * 2 * Math.asin(Math.sqrt a)
  end
end
