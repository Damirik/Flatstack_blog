class PagesController < ApplicationController
  expose_decorated :blogs, -> { Blog.all.page(params[:page]).per(10) }

  def index
  end
end
