require "openai"

class Chat < ApplicationRecord

  def self.generate_feedback(code, lang, api_key)
    begin
      feedback = try_gen_feedback(code, lang, api_key)
    rescue => e
      puts "====== Error: #{e.message} ======"
      feedback = e.message
    end
    feedback
  end

  def generate_summary(code, lang, api_key)
    # Implement ChatGPT call here!
    # Remember to return the summary
  end

  private
  def self.try_gen_feedback(code, lang, api_key)
    client = OpenAI::Client.new(
      access_token: api_key,
      request_timeout: 40
    )
    content1 = "#{code} \n Above is a piece of code in #{lang} language i have written, could you please give me some suggestions?"
    response1 = client.chat(
      parameters: {
          model: "gpt-3.5-turbo", # Required.
          messages: [{ role: "user", content: content1}], # Required.
      })
    feedback = response1.dig("choices", 0, "message", "content")
  end
end
