class BlogPolicy < ApplicationPolicy
  def authorized?
    record.user == user
  end
end
