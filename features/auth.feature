Feature: User authentication

  As a user, 
  I want to be able to sign up / log in for an account 
  so that I can save my API keys and code review history.

Background: Users in the database
  
    Given the following users exist:
      | email             | password | API key | salt |
      | test1@test.fake   | password | 123456  | 709  |
      | test2@user.fake   | password | 123456  | 685  |

Scenario: Unauthenticated user must log in
  Given an unauthenticated user
  When  the user tries to access "/"
  Then  the user should be redirected to the login page
  When  the user tries to access "/user/30"
  Then  the user should be redirected to the login page
  When  the user tries to access "/signup"
  Then  the user should be on the signup page
  When  the user tries to access the homepage of the user "test2@user.fake"
  Then  the user should be redirected to the login page

Scenario: User signs up for an account
  Given I am on the login page
  When  I follow the "Sign Up" link
  Then  I am redirected to the sign up page
  And   I fill in the email with "new.user@test.fake"
  And   I fill in the password with "pswd"
  And   I press "Submit"
  Then  I should be on the homepage of the user "new.user@test.fake"

Scenario: User cannot sign up for an existing account
  Given I am on the login page
  When  I follow the "Sign Up" link
  Then  I am redirected to the sign up page
  And   I fill in the email with "new.user@test.fake"
  And   I fill in the password with "yetanotherpswd"
  And   I press "Submit"
  Then  I should be on the signup page
  And   I should see "Fail to sign up. Account already exists"

Scenario: User fails to login
  Given I am on the login page
  And   I fill in the email with "new.user@test.fake"
  And   I fill in the password with "yetanotherpswd"
  And   I press "Log In"
  Then  I should be on the login page
  And   I should see "Incorrect username/password"

Scenario: User login
  Given I am on the login page
  And   I fill in the email with "new.user@test.fake"
  And   I fill in the password with "pswd"
  And   I press "Log In"
  Then  I should be on the homepage of the user "new.user@test.fake"

Scenario: Authenticated users cannot access other users' resource
  Given a user authenticated as "test1@test.fake"
  When  the user tries to access "/"
  Then  the user is redirected to the homepage of the user "test1@test.fake"
  When  the user tries to access the homepage of the user "test2@user.fake"
  Then  the user is redirected to the login page
