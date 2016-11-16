class PostPolicy < ApplicationPolicy
  def authorized?
    record.user == user
  end
end
