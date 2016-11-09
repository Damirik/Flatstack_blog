module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters, if: :devise_controller?

    USER_PARAMS = %i(
      full_name
      email
      password
      password_confirmation
    ).freeze

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: USER_PARAMS)
      devise_parameter_sanitizer.permit(:account_update, keys: USER_PARAMS)
    end

    def update_resource(resource, params)
      if params[:password].blank? & params[:password_confirmation].blank?
        resource.update_without_password(params)
      else
        resource.update_with_password(params)
      end
    end
  end
end
