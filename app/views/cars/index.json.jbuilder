json.array!(@cars) do |car|
  json.extract! car, :id, :car_make, :car_model, :car_version, :car_year, :car_city, :car_mileage, :car_price, :car_trans, :car_desc, :car_type, :car_approval, :user_id
  json.url car_url(car, format: :json)
end
