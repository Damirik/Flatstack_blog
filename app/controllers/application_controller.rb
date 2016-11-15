require "application_responder"

class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied
  self.responder = ApplicationResponder
  respond_to :html
  protect_from_forgery with: :exception

  def permission_denied
   flash[:danger] = 'Need to authorize'
   redirect_to root_path
  end
end
