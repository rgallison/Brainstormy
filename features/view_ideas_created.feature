#Rachel
Feature: View ideas I have created

As a user
So that I can view the ideas I have created
I want to see a list of ideas I have created on my profile page

Background: A user account has been created 
	Given the following user exists:
	| username                 | name          | email           | password |
	| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |

Scenario: I want to view the ideas I've created

Given I am on the "testuser" profile page
Then I should see the links 