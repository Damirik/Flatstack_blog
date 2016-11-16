FactoryGirl.define do
  factory :comment do
    body "TestComment"
    user
    post
  end
end
