#Rachel
Feature: Edit the user's profile page

As a user
So that I can change what other user's can see on my profile page
I want to edit the content of my profile

Background: A user account has been created and an image exists
	Given the following user exists:
	| username                 | name          | email           | password |
	| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |
	| testuser2                | John Doe      | jdoe@gmails.com | spot4    |

Scenario: I want to change my name

Given I have logged in to Brainstormy with username "testuser2"
And I am on the "testuser2" profile page
When I press "Edit Profile"
When I fill in "name" with "Sarah Yuli"
And I press "Submit"
Then I should see "Sarah Yuli"


Scenario: I want to change my e-mail

Given PENDING: I have logged in to Brainstormy with username"jsmith"
And I am on the profile page
When I press "Edit Profile"
When I fill in "email" with "Sarah@gmail.com"
When I fill in "email_confirmation" with "Sarah@gmail.com"
And I press "Submit"
Then I should see "Sarah@gmail.com"

Scenario: I want to change my password

Given PENDING: I have logged in to Brainstormy with username"jsmith"
And I am on the profile page
When I press "Edit Profile"
When I fill in "password" with "giggles"
When I fill in "password_confirmation" with "giggles"
And I press "Submit"
Then I should not see "giggles"

Scenario: I want to change my credential
Given PENDING: I have logged in to Brainstormy with username"jsmith"
And I am on the profile page
When I press "Edit Profile"
When I fill in credential with "Ruby on Rails programmer"
Then I should see "Ruby on Rails programmer" in the credential field

Scenario: I want to add a credential
Given PENDING: I have logged in to Brainstormy with username"jsmith"
And I am on the profile page
When I press "Edit Profile"
And I press "Add New Credential"
When I fill in credential with "Bird watcher of 15 years"
And I press "Submit"
Then I should see "Bird watcher of 15 years" in the credentials field

Scenario: I want to change my biography

Given PENDING: I have logged in to Brainstormy with username"jsmith"
And I am on the profile page
When I press "Edit Bio"
When I fill in "bio" with "My birdwatching has taken me all over the globe."
And I press "Submit"
Then I should see "My birdwatching has taken me all over the globe."

Scenario: I want to change my profile picture

Given PENDING: I have logged in to Brainstormy with username"jsmith"
And img_1 is an image
And I am on the profile page
When I press "Edit Profile"
And I choose img_1
And I press "Submit"
Then I should see img_1