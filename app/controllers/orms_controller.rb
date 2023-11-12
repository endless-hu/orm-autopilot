class OrmsController < ApplicationController
  before_action :set_chat, only: %i[show edit update destroy]
  def index
    @chats = Chat.all.order(id: :desc)
  end

  def show

  end

  def new
  end

  def edit
  end

  def create
    feedback, summary = Chat.generate_feedback(params[:code], params[:language])
    chat = Chat.create(code: params[:code], language: params[:language], feedback: feedback, summary: summary)
    redirect_to orm_path(chat)
    flash[:notice] = 'Chat was successfully created.'
  end

  def update
    feedback, summary = Chat.generate_feedback(params[:code], params[:language])
    chat = Chat.create(code: params[:code], language: params[:language], feedback: feedback, summary: summary)
    redirect_to orm_path(chat)
    flash[:notice] = 'Chat was successfully updated.'
  end

  # def destroy
  #   @chat.destroy
  #   redirect_to "/orms", notice: 'Chat was successfully deleted.'
  # end

  def destroy
    @chat.destroy
    redirect_to "/orms"
    flash[:notice] = 'Chat was successfully deleted.'
  end

  private

  def set_chat
    @chat = Chat.find(params[:id])
  end
end
