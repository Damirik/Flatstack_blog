FactoryGirl.define do
  factory :user do
    full_name { Faker::Name.name }
    email
    password "123456"
    password_confirmation { password }
  end
end
