3.times do
  FactoryGirl.create(:user, email: Faker::Internet.email, full_name: Faker::Name.name)
end

FactoryGirl.create(:user, email: "damirikq@gmail.com", full_name: "Damir Nurgaliev", password: "damir123")

100.times do
  FactoryGirl.create(:blog, subject: Faker::Name.title, user_id: 1)
  5.times do |blog|
    FactoryGirl.create(:post, title: Faker::Name.title, user_id: 1, blog_id: blog)
  end
end

100.times do
  FactoryGirl.create(:blog, subject: Faker::Name.title, user_id: 2)
  5.times do |blog|
    FactoryGirl.create(:post, title: Faker::Name.title, user_id: 2, blog_id: blog)
  end
end

100.times do
  FactoryGirl.create(:blog, subject: Faker::Name.title, user_id: 3)
  5.times do |blog|
    FactoryGirl.create(:post, title: Faker::Name.title, user_id: 3, blog_id: blog)
  end
end


