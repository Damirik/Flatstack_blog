class PostPolicy < ApplicationPolicy
  def create?
    blog = record.blog
    true if blog.user == user
  end
end
