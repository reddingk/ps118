class UsersController < ApplicationController
  def index
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have saved [" + @user.username + "], Welcome to PS-118"
      redirect_to '/users'
    else
      render 'new'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:username, :password, :email, :firstname, :lastname)
    end
  
end
