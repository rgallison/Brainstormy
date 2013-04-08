#Rachel
Feature: Edit the user's profile page

As a user
So that I can change what other user's can see on my profile page
I want to edit the content of my profile

Background: A user account has been created and an image exists

Given the following user exists:
| username                 | name          | email           | password |
| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |

Scenario: I want to change my name

Given I have logged in to Brainstormy
And I am on the profile page
When I press "Edit Profile"
And I fill in name with "Sarah Yuli"
And I press "Submit"
Then I should see "Sarah Yuli" in the name field

Scenario: I want to change my e-mail

Given I have logged in to Brainstormy
And I am on the profile page
When I press "Edit Profile"
And I fill in email1 with "Sarah@gmail.com"
And I fill in email2 with "Sarah@gmail.com"
And I press "Submit"
Then I should see "Sarah@gmail.com" in the e-mail field

Scenario: I want to change my password

Given I have logged in to Brainstormy
And I am on the profile page
When I press "Edit Profile"
And I fill in password1 with "giggles"
And I fill in password2 with "giggles"
And I press "Submit"
Then I should not see "giggles" in the password field

Scenario: I want to change my credential

Given I have logged in to Brainstormy
And I am on the profile page
When I press "Edit Profile"
And I fill in credential with "Ruby on Rails programmer"
Then I should see "Ruby on Rails programmer" in the credential field

Scenario: I want to add a credential

Given I have logged in to Brainstormy
And I am on the profile page
When I press "Edit Profile"
And I press "Add New Credential"
And I fill in credential with "Bird watcher of 15 years"
And I press "Submit"
Then I should see "Bird watcher of 15 years" in the credentials field

Scenario: I want to change my biography

Given I have logged in to Brainstormy
And I am on the profile page
When I press "Edit Bio"
And I fill in bio with "My birdwatching has taken me all over the globe."
And I press "Submit"
Then I should see "My birdwatching has taken me all over the globe." in the bio field

Scenario: I want to change my profile picture

Given I have logged in to Brainstormy
And img_1 is an image
And I am on the profile page
When I press "Edit Profile"
And I choose img_1
And I press "Submit"
Then I should see img_1