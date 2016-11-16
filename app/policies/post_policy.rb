class PostPolicy < ApplicationPolicy
  def authorized?
    record.user == user
  end

  def new?
    create?
  end

  def create?
    blog = record.blog
    true if blog.user == user
  end
end
