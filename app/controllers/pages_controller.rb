class PagesController < ApplicationController
  expose_decorated :blogs, -> { Blog.all.page(params[:page]).per(4) }

  def index
  end
end
