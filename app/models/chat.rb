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

  # def generate_summary(code, lang, api_key)
  #   # Implement ChatGPT call here!
  #   # Remember to return the summary
  # end

  private
  def self.try_gen_feedback(code, lang, api_key)
    client = OpenAI::Client.new(
      access_token: api_key,
      request_timeout: 150
    )
    content1 = <<~HEREDOC
    Prompt for Code Review:
    I have written the following piece of code in #{lang} using ORM:
    #{code}
    Could you please analyze it and provide feedback on some obvious inefficient design patterns or practices that might lead to an increased number of database fetches or inefficient database connections? I'm looking for detailed feedback on specific lines or sections of the code.
    The response format I am looking for is:
    - **Problem 1:** 
      - **Location:** Line [line number]
      - **Code Snippet:** `[code snippet]`
      - **Issue:** [description of the inefficiency]
    - **Problem 2:** 
      - **Location:** Line [line number]
      - **Code Snippet:** `[code snippet]`
      - **Issue:** [description of the inefficiency]
    ...
    - 
    **Fix**: [Please provide a revised version of the code snippet using proper code formatting.]
    HEREDOC
    response1 = client.chat(
      parameters: {
          model: "gpt-3.5-turbo", # Required.
          messages: [{ role: "user", content: content1}], # Required.
      })
    # puts the type of response1
    puts response1.class
    feedback = response1.dig("choices", 0, "message", "content")
  end
end
