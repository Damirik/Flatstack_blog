class UserBlogsController < ApplicationController
  def index
    @blogs = current_user.blogs
  end
end
