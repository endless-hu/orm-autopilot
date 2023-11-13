class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    if User.find_by(email: @user.email)
      flash[:alert] = "Email already exists!"
      redirect_to signup_path
    else
      if @user.save
        redirect_to login_path
      else
        flash[:alert] = "Register failed!"
        redirect_to signup_path
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
