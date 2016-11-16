class PostDecorator < Draper::Decorator
  decorates_association :blog

  delegate :title, :content, :created_at
  delegate :blog_id, to: :blog
  delegate :user_id, to: :user

  def formatted_created_at
    object.created_at.strftime("%m/%d/%Y - %H:%M")
  end
end
