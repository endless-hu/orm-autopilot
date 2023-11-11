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
    # feedback = GptClient.completions(params[:code])["choices"].map { |c| c["text"] }.join
    feedback = 'It is correct'
    chat = Chat.create(code: params[:code], feedback: feedback)
    redirect_to orm_path(chat.id)
  end

  def update
    # feedback = GptClient.completions(params[:code])["choices"].map { |c| c["text"] }.join
    feedback = 'It is correct'
    @chat.update(code: params[:code], feedback: feedback)
    redirect_to orm_path(@chat)
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
