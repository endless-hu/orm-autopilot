class Chat < ApplicationRecord

  def self.generate_feedback(code, lang)
    begin
      content1 = "#{code} \n Above is a piece of code in #{lang} language i have written, could you please give me some suggestions?"
        response1 = GptClient.chat(
          parameters: {
              model: "gpt-3.5-turbo", # Required.
              messages: [{ role: "user", content: content1}], # Required.
          })
        feedback = response1.dig("choices", 0, "message", "content")

        content2 = "What does this code in #{lang} language do: #{code}"
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
    [feedback, summary]
  end

  def generate_summary(code, lang, api_key)
    # Implement ChatGPT call here!
    # Remember to return the summary
  end
end
