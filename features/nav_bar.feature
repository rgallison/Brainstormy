Feature: Navigation Bar

A a user,
So that I can easily navigate the site
I want to create a persisent bar where I can find links to everything I need

Background: A user is logged in

	Given the following user exists:
	| username                 | name          | email           | password |
	| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |
	When I fill in "username_login" with "testuser"
	And I fill in "password" with "1234"
	And I press "Login"
