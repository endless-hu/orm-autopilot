require 'chatgpt/client'

api_key = Rails.application.credentials.gpt_key
GptClient = ChatGPT::Client.new(api_key)
