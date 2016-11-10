class UserBlogsController < ApplicationController
  expose :blogs, -> { current_user.blogs }

  def index
  end
end
