class PagesController < ApplicationController
  expose_decorated :blogs, -> { Blog.all }

  def index
  end
end
