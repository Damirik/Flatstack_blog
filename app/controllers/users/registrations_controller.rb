module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:
                                       [:full_name,
                                        :email,
                                        :password,
                                        :password_confirmation])
      devise_parameter_sanitizer.permit(:account_update, keys:
                                       [:full_name,
                                        :email])
    end

    def update_resource(resource, params)
      resource.update_without_password(params)
    end
  end
end
