class ApplicationController < ActionController::Base
  def current_user_is_admin?
    current_user.try(:is_admin) == true
   end 
end
