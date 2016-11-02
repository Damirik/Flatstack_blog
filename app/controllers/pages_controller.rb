class PagesController < ApplicationController
  def home
    @blogs = Blog.all
  end
end
