#Rachel
Feature: Edit the user's profile page

As a user
So that I can change what other user's can see on my profile page
I want to edit the content of my profile

Background: A user account has been created and an image exists

Given img_1 is an image
Given the following user exists:
| username                 | name          | email           | password |
| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |


Scenario: I want to change my profile picture

Given I have logged in to Brainstormy
And I am on the profile page
When I click "Edit Profile"
And I choose img_1
And I click "Submit"
Then I should see img_1

Scenario: I want to change my name

Given I have logged in to Brainstormy
And I am on the profile page
When I click "Edit Profile"
And I enter "Bob" in the name field
And I click "Submit"
Then I should see "Bob" in the name field

Scenario: I want to change my e-mail

Given I have logged in to Brainstormy
And I am on the profile page
When I click "Edit Profile"
And I enter "Bob@gmail.com" in the e-mail field
And I click "Submit"
Then I should see "Bob@gmail.com" in the e-mail field

Scenario: I want to change my password

Given I have logged in to Brainstormy
And I am on the profile page
When I click "Edit Profile"
And I enter "giggles" in the password field 1
And I enter "giggles" in the password field 2
And I click "Submit"
Then I should see "giggles" in the password field

Scenario: I want to change my credential

Given I have logged in to Brainstormy
And I am on the profile page
When I click "Edit Profile"
And I enter "Ruby on Rails programmer" in the credentials field
And I click "Submit"
Then I should see "Ruby on Rails programmer" in the credentials field

Scenario: I want to add a credential

Given I have logged in to Brainstormy
And I am on the profile page
When I click "Edit Profile"
And I click "Add New Credential"
And I enter "Bird watcher of 15 years" in the credentials field
And I click "Submit"
Then I should see "Bird watcher of 15 years" in the credentials field

Scenario: I want to change my biography

Given I have logged in to Brainstormy
And I am on the profile page
When I click "Edit Bio"
And I enter "My birdwatching has taken me all over the globe." in the bio field
And I click "Submit"
Then I should see "My birdwatching has taken me all over the globe." in the bio field