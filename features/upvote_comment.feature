#Lindsey Stratton
#This is a pending cucumber feature
#As in it doesn't work yet, certain step defintions 
#aren't in the step definition file and the test probably needs to be rewored

Feature: Upvote and idea

As a user
So that I can express my support for a comment
I want to upvote an idea and increase the rank of a comment

Background: I am logged in an on an idea page with comments

Given PENDING

Given the following user exists
| username                 | name          | email           | password |
| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |

Given the following idea exists:
|title     |user_id|
|test title|1      | 

Given the following comment exists:

Scenario: Upvote Comment
  Given I am on an idea page
  And there are comments
  When I press upvote on a comment by a certain user
  Then the value of rank should change
  
