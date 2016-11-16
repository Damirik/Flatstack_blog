class PostDecorator < Draper::Decorator
  delegate :title, :content, :user_id, :to_model
  delegate :user_id, to: :user

  decorates_association :blog
  decorates_association :comments

  def formatted_created_at
    object.created_at.strftime("%m/%d/%Y - %H:%M")
  end
end
