require "openai"

GptClient = OpenAI::Client.new(
  access_token: Rails.application.credentials.gpt_key,
  request_timeout: 40
)