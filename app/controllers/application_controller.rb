class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_paramenters, if: :devise_controller?

def after_sign_up_path_for(resource)
  user_path(current_user.id)
end

def after_sign_in_path_for(resource)
  user_path(current_user.id)
end

  protected

  def configure_permitted_paramenters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

   private

  def books_params
    params.require(:books).permit(:title, :body)
  end
end
