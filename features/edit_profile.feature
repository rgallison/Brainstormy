#Rachel
Feature: Edit the user's profile page

As a user
So that I can change what other user's can see on my profile page
I want to edit the content of my profile

Background: A user account has been created and an image exists
	Given the following user exists:
	| username                 | name          | email           | password |
	| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |
	Given I am on the home page
	When I fill in "user_username_login" with "testuser"
	And I fill in "user_password_login" with "1234"
	And I press "Login"
	And I follow "testuser"
	And I am on the "testuser" profile page

Scenario: I want to change my name

	When I press "Edit Profile"
	When I fill in "user_name" with "Sarah Yuli"
	When I fill in "user_email" with "jdoe@mills.edu"
	When I fill in "user_email_confirmation" with "jdoe@mills.edu"
	And I press "Update"
	Then I should see "Sarah Yuli"


Scenario: I want to change my e-mail

	When I press "Edit Profile"
	When I fill in "user_email" with "Sarah@gmail.com"
	When I fill in "user_email_confirmation" with "Sarah@gmail.com"
	And I press "Update"
	Then I should see "Sarah@gmail.com"


Scenario: I want to change my biography

	When I press "Edit Profile"
	When I fill in "user_bio" with "My birdwatching has taken me all over the globe."
	When I fill in "user_email" with "Sarah@gmail.com"
	When I fill in "user_email_confirmation" with "Sarah@gmail.com"
	And I press "Update"
	Then I should see "My birdwatching has taken me all over the globe."

Scenario: I want to change my profile picture

	Given PENDING: I have logged in to Brainstormy with username"jsmith"
	And img_1 is an image
	And I am on the profile page
	When I press "Edit Profile"
	And I choose img_1
	And I press "Submit"
	Then I should see img_1