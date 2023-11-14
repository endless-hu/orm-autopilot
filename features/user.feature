Feature: User Info Update

  As a user, 
  I want to be able to update my API key and password
  so that I can secure my account.

Background: Users in the database

    Given I have registered as "test1@test.fake" and logged in

Scenario: User fails to update its password
  When  I follow the "Update User Info" link
  Then  I should be on the edit page for the user "test1@test.fake"
  And   I fill in the Old Password with "newpassword"
  And   I fill in the New Password with "newnewpassword"
  And   I press "Update"
  Then  I should be on the edit page for the user "test1@test.fake"
  And   I should see "Incorrect Old Password"
  
Scenario: User password was not stored as plain text
  When  I follow the "Update User Info" link
  Then  I should be on the edit page for the user "test1@test.fake"
  And   I fill in the Old Password with "password"
  And   I fill in the New Password with "newpassword"
  And   I press "Update"
  Then  I should be on the homepage of the user "test1@test.fake"
  And   I should see "User Info Updated"
  And   the password of the user "test1@test.fake" should not be "newpassword"
