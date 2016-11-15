class CommentPolicy < ApplicationPolicy
  def authorized?
    record.user == user
  end
end
