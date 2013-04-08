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
Then I should be on the page for the idea "awesome new idea"
