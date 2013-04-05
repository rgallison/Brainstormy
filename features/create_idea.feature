Feature: post a new idea

As a user, 
So that I can share my ideas and collaborate with others, 
I want to create a page where I list my idea.

Scenario: Create a new idea from home page

Given I have logged into Brainstormy
And I am on the home screen
When I fill in "Post an idea" with "new idea"
And I click "Post"
Then I should be on the idea page