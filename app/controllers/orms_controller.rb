class OrmsController < ApplicationController
  before_action :set_chat, only: %i[update_page show edit update destroy]
  def index
  end

  def show

  end
  
  def new
  end

  def edit
  end

  def update_page

  end

  def history
    @chats = Chat.all.order(id: :desc)
  end

  def create
    # feedback = GptClient.completions(params[:code])["choices"].map { |c| c["text"] }.join
    feedback = 'It is correct'
    chat = Chat.create(code: params[:code], feedback: feedback)
    redirect_to "/orms/chat/#{chat.id}"
  end

  def update
    if params[:commit] == 'Update'
      # feedback = GptClient.completions(params[:code])["choices"].map { |c| c["text"] }.join
      feedback = 'It is correct'
      chat = Chat.create(code: params[:code], feedback: feedback)
      redirect_to "/orms/chat/#{chat.id}"
    else
      @chat.destroy
      redirect_to "/orms/new"
    end
  end

  def destroy
  end

  private

  def set_chat
    @chat = Chat.find(params[:id])
  end
end
