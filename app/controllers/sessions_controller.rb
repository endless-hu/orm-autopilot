class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_orms_path(user_id: user.id)
    else
      flash[:alert] = 'Oops! The email or password you entered doesn\'t match our records. Please try again.'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to login_path
  end
end
