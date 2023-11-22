class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address, :latitude, :longitude])
    devise_parameter_sanitizer.permit(:account_update, keys: [:address, :latitude, :longitude])
  end
end
