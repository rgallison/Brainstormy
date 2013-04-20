#Lindsey Stratton
#April 19
#I should get this to work now

Feature: Post a comment on an idea

As a user
So that I can provide my input on an idea
I want to make comments on another person's idea that can be seen by that person and other users.

Background: I already have an idea

Given PENDING: the following user exists:
| username                 | name          | email           | password |
| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |

Given PENDING: the following idea exists:
|title     |user_id|
|test title|1      | 

Scenario: Post a comment
  Given PENDING: I am on the home page
  When I fill in "user_username_login" with "testuser"
  And I fill in "user_password_login" with "1234"
  And I press "Login"

  Given PENDING: I am on the idea page for the idea with title "test title"
  When I follow "Post comment"
  Then I should be on the Post New comment page for the idea with title "test title"
  When I fill in "Body" with "test text"
  And press "Add comment"
  Then I should be on the idea page for the idea with title "test title"
  When I follow "All comments"
  Then I should see "test text"
