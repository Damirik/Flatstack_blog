class BlogDecorator < ApplicationDecorator
  delegate :subject
  delegate :user_id, to: :user

  decorates_association :posts
  decorates_association :user

  def posts_count
    object.posts.count
  end

  def author
    object.user.full_name
  end

  def posts_exists?
    object.posts.exists?
  end
end
