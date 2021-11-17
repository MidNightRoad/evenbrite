class AdminController < ApplicationController
before_action :current_user_is_admin?

def current_user_is_admin?
 current_user.try(:is_admin) == true
end 
def index 
  @user = User.all
  @evenement = Evenement.all
  @attendances = Attendance.all
end 
end
