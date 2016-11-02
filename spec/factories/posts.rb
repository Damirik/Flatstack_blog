FactoryGirl.define do
  factory :post do
    title "TestPost"
    content "TestContent"
    user
    blog
  end
end
