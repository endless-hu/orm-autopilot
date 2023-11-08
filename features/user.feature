Feature: User Info Update

  As a user, 
  I want to be able to update my API key and password
  so that I can secure my account.

Background: Users in the database
  
    Given the following users exist:
      | email             | password | api_key | salt |
      | test1@test.fake   | password | 123456  | 709  |
      | test2@user.fake   | password | 123456  | 685  |

    Given I am authenticated as "test1@test.fake"

Scenario: Cancel update
  When  I follow the "Update User Info" link
  Then  I should be on the edit page for the user "test1@test.fake"
  And   I fill in the API Key with "965713"
  And   I press "Cancel"
  Then  I should be on the homepage of the user "test1@test.fake"
  And   I should see "User Info Not Updated"
  And   the API key of the user "test1@test.fake" should be "123456"

Scenario: Authenticated user tries to update its API key
  When  I follow the "Update User Info" link
  Then  I should be on the edit page for the user "test1@test.fake"
  And   I fill in the API Key with "965713"
  And   I press "Update"
  Then  I should be on the homepage of the user "test1@test.fake"
  And   I should see "User Info Updated"
  And   the api_key of the user "test1@test.fake" should be "965713"

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
