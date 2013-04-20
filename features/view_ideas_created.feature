#Rachel
Feature: View ideas I have created

As a user
So that I can view the ideas I have created
I want to see a list of ideas I have created on my profile page

Background: A user account has been created and an idea has been created
	Given the following user exists:
	| username                 | name          | email           | password | 
	| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |
	Given I am on the home page
	When I fill in "user_username_login" with "testuser"
	And I fill in "user_password_login" with "1234"
	And I press "Login"
	Given the following idea exists
	| title                 			| user_id          |
	| Send Your Senator A Joke Day      | 1                | 

Scenario: I want to view the ideas I've created

Given I am on the "testuser" profile page
Then I should see the link "Send Your Senator A Joke Day"