class UsersController < ApplicationController
  before_action :require_login, only: %i[show]
  def new
  end

  def create
    @user = User.new(user_params)

    if User.find_by(email: @user.email)
      flash[:alert] = "Fail to sign up. Account already exists!"
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

  def show
    # This is a fake method.
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user && @user.authenticate(params[:password])
      @user.update(password_digest: params[:new_password])
      flash[:notice] = 'User info was successfully updated.'
      redirect_to user_orms_path(@user)
    else
      flash[:alert] = 'Wrong password! Fail to update user info.'
      redirect_to edit_user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def require_login
    @current_user = User.find(session[:user_id]) if session[:user_id]
    unless @current_user
      flash[:alert] = 'You must be logged in to access this section'
      redirect_to login_url
    end
  end
end
