class UserBlogsController < ApplicationController
  expose_decorated :blogs, -> { current_user.blogs }

  def index
  end
end
