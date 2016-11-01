class UsersController < ApplicationController
  before_action :authenticate_user!
  def profile
    @blogs = current_user.blogs
  end
end
