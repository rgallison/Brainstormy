Feature: User can sign into their account on the site

Background
	Given PENDING: the following user exists:
	| username                 | name          | email           | password |
	| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |

Scenario: Sign into Brainstormy
	Given I am on the home page
	When I fill in "user_username_login" with "testuser"
	And I fill in "user_password_login" with "1234"
	And I press "Sign In"
	Then I should see "Post An Idea"
	And I should see "Log Out"
	And I should see "News Feed"