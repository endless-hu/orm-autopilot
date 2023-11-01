
Given /the following reviews exist/ do |reviews_table| 
  reviews_table.hashes.each do |review|
    Chat.create!(review)
  end
end