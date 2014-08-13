# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    car_make "MyString"
    car_model "MyString"
    car_version "MyString"
    car_year 1
    car_city "MyString"
    car_mileage 1
    car_price 1
    car_trans "MyString"
    car_desc "MyString"
    car_type "MyString"
    car_approval false
    user_id 1
  end
end
