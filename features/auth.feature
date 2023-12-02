Feature: User authentication

  As a user, 
  I want to be able to sign up / log in for an account 
  so that I can save my API keys and code review history.

Background: Users in the database
  
    Given the following users exist:
      | email             | password_digest |
      | test1@test.fake   | password_digest |
      | test2@user.fake   | password_digest |

Scenario: Unauthenticated user must log in
  Given an unauthenticated user
  When  I try to access "/"
  Then  I should be redirected to the login page
  When  I try to access "/users/30"
  Then  I should be redirected to the login page
  When  I try to access "/signup"
  Then  I should be on the signup page
  When  I try to access the homepage of the user "test2@user.fake"
  Then  I should be redirected to the login page

Scenario: User signs up for an account
  Given I am on the login page
  When  I follow the "signup-link" link
  Then  I should be redirected to the signup page
  And   I fill in the email with "new.user@test.fake"
  And   I fill in the password with "pswd"
  And   I press "Sign Up"
  Then  I should be redirected to the login page

Scenario: User cannot sign up for an existing account
  Given I have registered as "new.user@test.fake" with password "pswd"
  When  I follow the "signup-link" link
  Then  I should be redirected to the signup page
  And   I fill in the email with "new.user@test.fake"
  And   I fill in the password with "yetanotherpswd"
  And   I press "Sign Up"
  Then  I should be on the signup page
  And   I should see "Fail to sign up. Account already exists!"

Scenario: User fails to sign up due to server DB's error
  Given I stubbed the "save" method of the class User to return "false"
  Given I have registered as "new.user@test.fake" with password "pswd"
  And   I should see "Register failed!"

Scenario: User fails to login
  Given I have registered as "new.user@test.fake" with password "pswd"
  And   I fill in the email with "new.user@test.fake"
  And   I fill in the password with "yetanotherpswd"
  And   I press "Log In"
  Then  I should be redirected to the login page
  And   I should see "Oops! The email or password you entered doesn't match our records. Please try again."

Scenario: User login
  Given I have registered as "new.user@test.fake" with password "pswd"
  And   I fill in the email with "new.user@test.fake"
  And   I fill in the password with "pswd"
  And   I press "Log In"
  Then  I should be redirected to the homepage of the user "new.user@test.fake"

Scenario: Authenticated users cannot access other users' resource
  Given I have registered as "new.user@test.fake" and logged in
  When  I try to access "/"
  Then  I should be redirected to the homepage of the user "new.user@test.fake"
  When  I try to access the homepage of the user "test2@user.fake"
  Then  I should be redirected to the login page

Scenario: Authenticated users cannot access other users' resource 2
  Given I have registered as "new.user@test.fake" and logged in
  When  I follow the "New" link
  Then  I should be on the new review page for the user "new.user@test.fake"
  When  I try to access "/users/1/orms/new"
  Then  I should be redirected to the login page
