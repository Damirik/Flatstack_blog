class PostDecorator < ApplicationDecorator
  include ActionView::Helpers::TextHelper

  delegate :title, :content, :user_id
  delegate :user_id, to: :user

  decorates_association :blog
  decorates_association :comments

  def comments_count
    object.comments.count
  end

  def author
    object.user.full_name
  end

  def preview
    truncate(object.content)
  end
end
