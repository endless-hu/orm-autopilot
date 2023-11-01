Feature: a basic workflow

  As a user
  So that I can use the app
  I want to paste my ORM code and get reviews.

Background: ORM reviews in the database

  Given the following reviews exist:
  |  code        | feedback         |
  | test code 1  | Good             |
  | test code 2  | No Bad Usage     |

Scenario: view history reviews
  Given I am on the new review page
  When I follow the "History" link
  Then I should be on the homepage
  Then I should see the "test code 1" code

Scenario: submit a review
  Given I am on the homepage
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
  And I should see the "Edit" button

Scenario: cancel an editing review
  Given I am on the review page for chat ID "1"
  And I press "Edit"
  Then I should be on the edit review page for chat ID "1"
  When I fill in the form with the ORM code "Update to test 1"
  When I follow the "Cancel" link
  Then I should be on the homepage
  And I should not see the review "Update to test 1"

Scenario: delete a review
  Given I am on the review page for chat ID "1"
  And I press "Edit"
  Then I should be on the edit review page for chat ID "1"
  When I follow the "Delete" link
  Then I should be on the homepage
  And I should not see the review "test 1"