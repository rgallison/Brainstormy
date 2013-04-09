#Lindsey Stratton
#April 8 2013

Feature: Post a comment on an idea

As a user
So that I can provide my input on an idea
I want to make comments on another person's idea that can be seen by that person and other users.

Background: I already have an idea

Given the following user exists:
| username                 | name          | email           | password |
| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |

Given the following idea exists:
|title     |user_id|
|test title|1      | 

Scenario: Post a comment
  Given I am on an idea page
  When I follow "Post comment"
  Then I should be on the Post New comment page
  When I fill in "Comment" with "test text"
  And press "Post"
  Then I should be on an idea page
  When I follow "All Comments" #currently failing in cucumber, but works in browser
  Then I should see "test text" #currently not working
