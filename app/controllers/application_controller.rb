class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email bio photo password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email bio photo password current_password])
end
end
