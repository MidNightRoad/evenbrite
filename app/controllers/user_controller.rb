class UserController < ApplicationController
  def show 
    received_id = params[:id]
    @user = User.find(received_id)
    @user_first_name = @user.first_name
    @user_last_name = @user.last_name
    @user_description = @user.description
    @user_email = @user.email
  end
  def destroy
    User.find(params[:id].to_i).destroy

  end
  def update
    @user = User.find(params[:id])
    @user_first_name = params[:first_name]
    @user_last_name = params[:last_name]

    @user_email = params[:email]
    @user_description = params[:description]
    @user_is_admin = params[:is_admin]
     puts '-----------------------------------------------------'
    puts @user_email 
   puts  "--------------------------------------------------------"
    if @user.update(first_name:@user_first_name, last_name: @user_last_name, email:@user_email , description: @user_description, is_admin:@user_is_admin)
      redirect_to '/'
    end
  
  end
  def edit
    @user = User.find(params[:id])
    @user_first_name = @user.first_name
    @user_last_name = @user.last_name
    @user_email = @user.email
    @user_description = @user.description
    @user_is_admin = @user.is_admin
  end
end