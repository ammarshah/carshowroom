# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    car_type "MyString"
    make "MyString"
    model "MyString"
    version "MyString"
  end
end
