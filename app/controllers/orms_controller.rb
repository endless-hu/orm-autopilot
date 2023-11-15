class OrmsController < ApplicationController
  before_action :authenticate_user
  before_action :authorize_user, only: %i[index show edit update destroy]
  before_action :set_chat, only: %i[show edit update destroy]

  def redirect_to_user_orms
    redirect_to user_orms_path(@current_user)
  end

  def redirect_to_user_orms_new
    redirect_to new_user_orm_path(@current_user)
  end

  def index
    # only display chats that belong to the current user
    @chats = Chat.where(user_id: session[:user_id]).order(id: :desc)
  end

  def show

  end

  def new
  end

  def edit
  end

  def create
    feedback = Chat.generate_feedback(params[:code], params[:language], Rails.application.credentials.gpt_key)
    @chat = Chat.create(code: params[:code], language: params[:language], feedback: feedback, user_id: session[:user_id], title: 'test')
    flash[:notice] = 'Chat was successfully created.'
    redirect_to user_orm_path(@current_user, @chat)
  end

  def update
    feedback = Chat.generate_feedback(params[:code], params[:language], Rails.application.credentials.gpt_key)
    @chat.update(code: params[:code], language: params[:language], feedback: feedback)
    flash[:notice] = 'Chat was successfully updated.'
    redirect_to user_orm_path(@current_user, @chat)
  end

  def destroy
    @chat.destroy
    redirect_to "/orms", notice: 'Chat was successfully deleted.'
  end

  def destroy
    @chat.destroy
    redirect_to "/orms"
    flash[:notice] = 'Chat was successfully deleted.'
  end

  private

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def authenticate_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
    unless @current_user
      flash[:alert] = 'You must be logged in to access this section'
      redirect_to login_url
    end
  end

  def authorize_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
    unless @current_user.id == params[:user_id].to_i
      flash[:alert] = 'You are not authorized to access this section'
      redirect_to login_url
    end
  end
end
