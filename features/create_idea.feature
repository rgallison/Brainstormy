Feature: post a new idea

As a user, 
So that I can share my ideas and collaborate with others, 
I want to create a page where I list my idea.

Background: A user account has been created

Given the following user exists:
| username                 | name          | email           | password |
| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |

Scenario: Create a new idea from home page

#Given I have logged in to Brainstormy
And I am on the home page
When I fill in "Post an idea" with "awesome new idea"
And I press "Post"
Then I should be on the edit page for the idea "awesome new idea"
And I should see "awesome new idea"
And I should see "Jane Doe"


Scenario: Fill in additional idea information after initial creation
Given that the following idea exists:
| title                 | user_id          |
| awesome new idea      | 1                |
Given I am now on the edit page for idea with title "awesome new idea"
Then I fill in "description" with "this is the best idea ever"
And I uncheck "Make Private"
And I press "Save and Post"
Then I should be on the idea page for the idea with title "awesome new idea"
