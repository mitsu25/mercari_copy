class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action  :redirect_to_addresses_new_action, only: :create, if: :devise_controller?
  protect_from_forgery with: :exception

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
   devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def redirect_to_addresses_new_action
    redirect_to new_address_path
  end
end
