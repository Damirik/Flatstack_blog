class UsersController < ApplicationController
  before_action :authenticate_user!
  def profile
    @blogs = Blog.where(user_id: current_user.id)
  end
end
