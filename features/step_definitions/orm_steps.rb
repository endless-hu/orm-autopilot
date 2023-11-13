
Given /the following reviews exist/ do |reviews_table| 
  reviews_table.hashes.each do |review|
    Chat.create!(review)
  end
end

Given /I stubbed the "try_gen_feedback" method of the class Chat to raise an exception/ do 
  allow(Chat).to receive(:try_gen_feedback).and_raise("Sorry, the GPT API call timed out. Please try again later.")
end
