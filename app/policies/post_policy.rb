class PostPolicy < ApplicationPolicy
  def create?
    record.blog.user == user
  end
end
