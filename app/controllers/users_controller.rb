class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params 
    if @user.save
      session[:user_id] = @user.id #sets the session id
      redirect_to root_path
    else 
      render :new #render the form again to re-attempt signup
    end
  end

  def edit
    @user = @current_user
  end

  def update
      user = User.find(@current_user.id)
      user.update user_params
      redirect_to root_path
  end

  def destroy
  end

private # strong params 
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address_num, :address_street, :address_suburb, :address_city, :address_country, :address_postcode, :phone)
  end

end