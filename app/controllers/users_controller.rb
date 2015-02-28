class UsersController < ApplicationController
  def index
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to PS118 [" + @user.username + "]"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:username, :password,:password_confirmation, :email, :firstname, :lastname)
    end
  
end
