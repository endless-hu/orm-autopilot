Feature: a basic workflow

  As a user
  So that I can use the app
  I want to paste my ORM code and get reviews.

Background: Users and ORM reviews in the database

  Given the following reviews exist:
| code        | feedback     | created_at           | updated_at           | language | user_id  | last_updated        | title  |
| test code 1 | Good         | 2023-11-07 14:30:00  | 2023-11-07 15:00:00  | Python   | 1        | 2023-11-07 14:30:00 | code1  |
| test code 2 | No Bad Usage | 2023-11-08 09:45:00  | 2023-11-08 10:15:00  | Python   | 1        | 2023-11-08 09:45:00 | code2  |

Scenario: view history reviews
  Given I have registered as "test1@test.fake" and logged in
  When I follow the "History" link
  Then I should be on the homepage of the user "test1@test.fake"
  Then I should see the "test code 1" code
  Then I should see the "test code 2" code


Scenario: delete a review
  Given I have registered as "test1@test.fake" and logged in
  When I follow the "History" link 
   And I follow the "chat-1" link
  And I press "Edit"
  Then I should be on the edit review page for chat ID "1" for email "test1@test.fake"
  When I follow the "Delete" link
  Then I should be on the homepage of the user "test1@test.fake"
  And I should not see the review "test 1"

Scenario: submit a review
  Given I have registered as "test1@test.fake" and logged in
  When I follow the "New" link
  Then I should be on the new review page for the user "test1@test.fake"
  When I fill in the form with the ORM code "test 1"
  And I press "Submit"
  Then I should be on the review page for "test 1" for "test1@test.fake"
  And I should see the reviews
  And I should see the "Edit" button

Scenario: update a review
  Given I have registered as "test1@test.fake" and logged in
  Given I am on the review page for chat ID "1" for email "test1@test.fake"
  And I press "Edit"
  Then I should be on the edit review page for chat ID "1" for email "test1@test.fake"
  When I fill in the form with the ORM code "Update to test 1"
  And I press "Update"
  Then I should be on the review page for chat ID "1" for email "test1@test.fake"
  Then I should see the "Update to test 1" code
  And I should see the reviews

Scenario: cancel an editing review
 Given I have registered as "test1@test.fake" and logged in
 When I follow the "History" link
  And I follow the "chat-1" link
  Then I should be on the review page for "test code 1" for "test1@test.fake"
  And I press "Edit"
  Then I should be on the edit review page for chat ID "1" for email "test1@test.fake"
  When I fill in the form with the ORM code "Updates to code1"
  When I follow the "Cancel" link
  Then I should be on the homepage of the user "test1@test.fake"
  And I follow the "chat-1" link
  Then I should not see the review "Updates to code1"


Scenario: GPT API call times out and throws exception
  Given I stubbed the "try_gen_feedback" method of the class Chat to raise an exception
  When I follow the "New" link
  When I fill in the form with the ORM code "test 1"
  And I press "Submit"
  Then I should be on the review page for "test 1"
  Then I should see "Sorry, the GPT API call timed out. Please try again later."
