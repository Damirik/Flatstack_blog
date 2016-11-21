class PostDecorator < ApplicationDecorator
  delegate :title, :content, :user_id
  delegate :user_id, to: :user

  decorates_association :blog
  decorates_association :comments

  def formatted_created_at
    object.created_at.strftime("%m/%d/%Y - %H:%M")
  end

  def comments_count
    object.comments.count
  end

  def author
    object.user.full_name
  end

  def preview
    if object.content.scan('.').empty?
      object.content[0,100]
    else
      object.content.split('.')[0]
    end
  end
end
