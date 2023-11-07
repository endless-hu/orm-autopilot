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
    begin
      content1 = "#{params[:code]} \n Above is a piece of code in #{params[:language]} language i have written, could you please give me some suggestions?"
        response1 = GptClient.chat(
          parameters: {
              model: "gpt-3.5-turbo", # Required.
              messages: [{ role: "user", content: content1}], # Required.
          })
        feedback = response1.dig("choices", 0, "message", "content")

        content2 = "What does this code in #{params[:language]} language do: #{params[:code]}"
        response2 = GptClient.chat(
          parameters: {
              model: "gpt-3.5-turbo", # Required.
              messages: [{ role: "user", content: content2}], # Required.
          })
        summary = response2.dig("choices", 0, "message", "content")
    rescue => e
      puts "====== Error: #{e.message} ======"
      feedback = 'It is correct'
      summary = 'It is correct'
    end
    chat = Chat.create(code: params[:code], language: params[:language], feedback: feedback, summary: summary)
    redirect_to "/orms/chat/#{chat.id}"
  end

  def update
    if params[:commit] == 'Update'
      begin
        content1 = "#{params[:code]} \n Above is a piece of code in #{params[:language]} language i have written, could you please give me some suggestions?"
        response1 = GptClient.chat(
          parameters: {
              model: "gpt-3.5-turbo", # Required.
              messages: [{ role: "user", content: content1}], # Required.
          })
        feedback = response1.dig("choices", 0, "message", "content")

        content2 = "What does this code in #{params[:language]} language do: #{params[:code]}"
        response2 = GptClient.chat(
          parameters: {
              model: "gpt-3.5-turbo", # Required.
              messages: [{ role: "user", content: content2}], # Required.
          })
        summary = response2.dig("choices", 0, "message", "content")
      rescue => e
        puts "====== Error: #{e.message} ======"
        feedback = 'It is correct'
        summary = 'It is correct'
      end
      chat = Chat.create(code: params[:code], language: params[:language], feedback: feedback, summary: summary)
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
