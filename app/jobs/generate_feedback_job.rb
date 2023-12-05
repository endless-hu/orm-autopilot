class GenerateFeedbackJob < ApplicationJob
  queue_as :default

  def perform(chat_id)
    chat = Chat.find(chat_id)
    feedback = Chat.generate_feedback(chat.code, chat.language, Rails.application.credentials.gpt_key)
    chat.update(feedback: feedback)
  end
end
