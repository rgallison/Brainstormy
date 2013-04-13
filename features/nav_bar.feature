Feature: Navigation Bar

A a user,
So that I can easily navigate the site
I want to create a persisent bar where I can find links to everything I need

Background: A user exists in database

	Given the following user exists:
	| username                 | name          | email           | password |
	| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |
	And I am on the home page
	And I fill in "user_username_login" with "testuser"
	And I fill in "user_password_login" with "1234"
	And I press "Login"

Scenario: the nav bar should be visible in home
	Given that I am on the home page
	Then I should see "testuser"

Scenario: the nav bar should be visible in profile
	Given that I am on the home page
	And I go to the "testuser" profile page
	Then I should see "testuser"

Scenario: the nav bar should be visible on an idea page
	Given that the following idea exists:
	| title                 | user_id          |
	| awesome new idea      | 1                |
	Given that I am now on the edit page for idea with title "awesome new idea"
	Then I should see "testuser"

Scenario: the nav bar should have...
	Given that I am on the home page
	Then I should see the following: "testuser", "logout", "ideas", "messages", "settings" 

Scenario: When I click on my username, I should be on my profile page
	Given PENDING: that I am on the home page
	And I follow "testuser"
	Then I should be on "testuser" profile page

Scenario: When I click the logout button, I should log out of my account
	Given PENDING: that I am on the home page
	And I click "logout"
	Then I should see "Sign In"

Scenario: When I click on the ideas button, I should see a list of ideas I'm involved with
	Given PENDING: that I am on the home page
	And I click "ideas"
	Then I should see "awesome new idea"

Scenario: When I click on the messages button, I should go to my inbox
	Given PENDING: that I am on the home page
	And I click "messages"
	Then I should be on "testuser" message page

Scenario:
	Given PENDING: that I am on the home page
	And I click "settings"
	Then I shoul be on the settings page

