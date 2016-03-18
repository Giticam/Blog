class UsersController < ApplicationController
before_action :find_user, only: [:show,:edit,:update,:edit_password,:update_password]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in(@user)
      redirect_to root_path,
      notice: "User Created!"
    else
      flash[:alert] = "User Created!"
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @user.update user_params
      redirect_to posts_path, notice: "Update successfully"
    else
      render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,:password, :password_digest)
  end

  def find_user
    @user = User.find params[:id]
  end

end
