class PostPolicy < ApplicationPolicy
  def authorized?
    record.user == user
  end

  def new?
    create?
  end

  def create?
    true
  end
end
