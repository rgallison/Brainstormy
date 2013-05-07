#Lindsey Stratton

Feature: Upvote and idea

As a user
So that I can express my support for a comment
I want to upvote an idea and increase the rank of a comment

Background: I am logged in an on an idea page with comments

Given the following user exists
| username                 | name          | email           | password |
| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |

Given the following idea exists:
|title     |user_id|
|test title|1      | 

#Given the following comment exists:
#|text     |user_id|idea_id|
#|test text|4      |1      |

Scenario: Upvote Comment
 Given I am on the home page
 When I fill in "user_username_login" with "testuser"
 And I fill in "user_password_login" with "1234"
 And I press "Login"

 Given I am on the idea page for the idea with title "test title"
  When I follow "Post comment"
  Then I should be on the Post New comment page for the idea with title "test title"
  When I fill in "Comment" with "test text"
  And press "Add Comment"
  Then I should be on the idea page for the idea with title "test title"
  And I should see "test text" 

 When I follow "+"
 Then I should be on the idea page for the idea with title "test title"
 And I should see "1"

 When I follow "-"
 Then I should be on the idea page for the idea with title "test title"
 And I should see "-1"
