class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramenters, if: :devise_controller?

  protected

  def configure_permitted_paramenters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
