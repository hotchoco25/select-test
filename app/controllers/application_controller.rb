class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:main_name, :sub_name, :password, :password_confirmation, :position) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :main_name, :sub_name, :password) }
  end
end
