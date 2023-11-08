World(AuthenticationHelpers)

Given /an unauthenticated user/ do
  # do nothing
end

When /the user tries to access "(.*)"/ do |path|
  visit path
end

Then /the user should be redirected to the login page/ do
  expect(current_url).to match(%r{/login})
end

Then /the user should be on the signup page/ do
  expect(current_url).to match(%r{/signup})
end

When /the user tries to access the homepage of the user "(.*)"/ do |email|
  user = User.find_by(email: email)
  visit user_orms_path(user)
end
