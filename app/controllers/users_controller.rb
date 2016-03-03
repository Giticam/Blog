class UsersController < ApplicationController
before_action :find_user, only: [:create,:edit,:update]
  def new
    @user = User.new
  end

  def create


    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path,
      notice: "User Created!"
    else
      flash[:alert] = "User Created!"
      render :new
    end
  end

  def edit

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