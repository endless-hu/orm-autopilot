Feature: a basic workflow

  As a user
  So that I can use the app
  I want to paste my ORM code and get reviews.

Background: Users and ORM reviews in the database

  Given the following reviews exist:
      |  code        | feedback         | title | last_updated        | user_email      |
      | test code 1  | Good             | code1 | 2023-11-07 14:30:00 | test1@test.fake |
      | test code 2  | No Bad Usage     | code2 | 2023-11-08 09:45:00 | test1@test.fake |

  Given the following users exist:
      | email             | password | api_key | salt |
      | test1@test.fake   | password | 123456  | 709  |
      | test2@user.fake   | password | 123456  | 685  |

  Given I am authenticated as "test1@test.fake"
  Given I have stubbed the "generate_feedback" method of the class Chat
  Given I have stubbed the "generate_summary" method of the class Chat

Scenario: view history reviews
  When I follow the "History" link
  Then I should be on the homepage
  Then I should see the "code1" code
  Then I should see the "code2" code

Scenario: submit a review
  When I follow the "New" link
  Then I should be on the new review page
  When I fill in the form with the ORM code "test 1"
  And I press "Submit"
  Then I should be on the review page for "test 1"
  And I should see the reviews
  And I should see the "Edit" button

Scenario: update a review
  Given I am on the review page for chat ID "1"
  And I press "Edit"
  Then I should be on the edit review page for chat ID "1"
  When I fill in the form with the ORM code "Update to test 1"
  And I press "Update"
  Then I should be on the review page for chat ID "1"
  Then I should see the "Update to test 1" code
  And I should see the reviews

Scenario: cancel an editing review
  And I follow the "code1" link
  Then I should be on the review page for "code1"
  And I press "Edit"
  Then I should be on the edit review page for "code1"
  When I fill in the form with the ORM code "Updates to code1"
  When I follow the "Cancel" link
  Then I should be on the homepage
  And I follow the "code1" link
  Then I should be on the review page for "code1"
  And I should not see the review "Updates to code1"

Scenario: delete a review
  Given I am on the review page for chat ID "1"
  And I press "Edit"
  Then I should be on the edit review page for chat ID "1"
  When I follow the "Delete" link
  Then I should be on the homepage
  And I should not see the review "test 1"
  And I should see "[code1] was deleted"