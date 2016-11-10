class PagesController < ApplicationController
  expose :blogs, -> { Blog.all }

  def index
  end
end
