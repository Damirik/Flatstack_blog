class CommentDecorator < Draper::Decorator
  delegate :post_id, to: :post
  delegate :user_id, to: :user

  decorates_association :user
  decorates_association :post

  delegate_all
end
