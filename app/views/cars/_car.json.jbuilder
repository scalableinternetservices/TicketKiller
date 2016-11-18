json.extract! car, :id, :user_id, :long, :lat, :created_at, :updated_at, :name
json.url car_url(car, format: :json)