require 'uri'
require 'cgi'

Given /I am on the new review page/ do
  visit new_orm_path
end

Given /I am on the homepage/ do
  visit orms_path
end

Given /I am on the review page for chat ID "(\d+)"/ do |id| 
  visit orm_path(id)
end

Then /I should be on the homepage/ do
  expect(page).to have_current_path(orms_path)
end

Then /I should be on the new review page/ do
  expect(page).to have_current_path(new_orm_path)
end

Then /I should be on the review page for "(.*)"/ do |code|
  expect(current_url).to match(%r{/orms/(\d+)})
  expect(page).to have_content(code)
end

Then /I should be on the review page for chat ID "(\d+)"/ do |id|
  expect(current_url).to match(%r{/orms/#{id}})
end

Then('I should be on the edit review page for {string} of the user {string}') do |review_title, email|
  user = User.find_by(email: email)
  review = user.orms.find_by(title: review_title)
  expect(current_url).to eq(edit_user_orm_path(review))
end

Then /I should be on the edit review page for chat ID "(\d+)"/ do |id|
  expect(current_url).to match(%r{/orms/#{id}/edit})
end

Then /I should see a div with class "(.*)"/ do |class_name|
  expect(page).to have_css("div.#{class_name}")
end

Then('I should not see the review {string}') do |string|
  expect(page).not_to have_content(string)
end

Then /I should see the "(.*)" code/ do |code|
  expect(page).to have_content(code)
end

When /I follow the "(.*)" link/ do |link|
  click_link(link)
end

When /I fill in the form with the ORM code "(.*)"/ do |code|
  fill_in 'code', with: code
end

And /I press "(.*)"/ do |button|
  click_button(button)
end

And /I should see the reviews/ do 
  step "I should see a div with class \"feedback-div\"" 
end

And /I should see the "(.*)" button/ do |button|
  expect(page).to have_button(button)
end

And /I should see "(.*)"/ do |content|
  expect(page).to have_content(content)
end
