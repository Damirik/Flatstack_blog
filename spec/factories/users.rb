FactoryGirl.define do
  factory :user do
    email
    password "123456"
    password_confirmation { password }
  end
end
