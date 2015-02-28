class UsersController < ApplicationController
  def index
    #@users = User.all
    @users = User.paginate(page: params[:page])
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
  
  def edit
    @user = User.find(session[:user_id])
  end
  
  def update
    @user = User.find(session[:user_id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to :root
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to '/users'
  end
  
  private

    def user_params
      params.require(:user).permit(:username, :password,:password_confirmation, :email, :firstname, :lastname, :admin)
    end
  
end
