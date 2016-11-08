class PagesController < ApplicationController
  def index
    @blogs = Blog.all
  end
end
