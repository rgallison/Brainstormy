Feature: User can login to their account on the site

Background: A user account has been created

Given the following user exists:
| username                 | name          | email           | password |
| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |

Scenario: Login to Brainstormy
	Given I am on the home page
	When I fill in "user_username_login" with "testuser"
	And I fill in "user_password_login" with "1234"
	And I press "Login"
	Then I should see "Post An Idea"
	And I should see "testuser"
	And I should see "News Feed"