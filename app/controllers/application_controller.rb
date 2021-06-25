class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :main_name, :sub_name, :password, :password_confirmation, :position
    ])
    devise_parameter_sanitizer.permit(:sign_in, keys: [
      :login, :main_name, :sub_name, :password
    ])
  end
end
