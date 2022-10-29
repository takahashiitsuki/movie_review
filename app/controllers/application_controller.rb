class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  require 'themoviedb-api'
  Tmdb::Api.key("95405e6efc8fc27ba9e99c3e27422cf5")
  Tmdb::Api.language("ja") # こちらで映画情報の表示の際の言語設定を日本語にできます
  
  def after_sign_out_path_for(resource)
    if resource == :admin
      admin_session_path
    else
      root_path
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
