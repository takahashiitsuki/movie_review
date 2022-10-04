class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def after_sign_out_path_for(resource)
    if resource == :admin
      admin_session_path
    else
      root_path
    end
  end
  
end
