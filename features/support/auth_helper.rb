module AuthenticationHelpers
  def login_as(user)
    user = User.find_by(email: email)
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in' 
  end
end