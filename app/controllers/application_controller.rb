class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?


  #サインイン後のページ
  def after_sign_in_path_for(resource)
	  user_path(resource)
  end
  #サインアウト後のページ
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

      def configure_permitted_parameters
        if resource_class == User
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
            devise_parameter_sanitizer.permit(:sign_in,keys:[:name])
            devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email])
    end
  end
end