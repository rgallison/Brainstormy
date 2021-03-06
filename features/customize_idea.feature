#Colin
Feature: Customize an idea

As an idea creator,
So that I can customize my idea
I want to allow user to include a further description of the idea and control the setting of the idea post

Background: 3 user accounts have been created
Given the following users exists:
| username                 | name          | email           | password |
| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |
| testuser2                | Mark Doe      | mdoe@mills.edu  | 1234     |
| testuser3				   | Jess Doe	   | jessdoe@mills.edu | 1234   |

Scenario: Set an idea to private
Given that the following idea exists:
| title                 | user_id          |
| awesome new idea      | 1                |
Given I am on the home page
When I fill in "user_username_login" with "testuser"
And I fill in "user_password_login" with "1234"
And I press "Login"
Given I am now on the edit page for idea with title "awesome new idea"
Then I fill in "collaborator" with "testuser3"
And I press "Add Collaborator"

Then I fill in "description" with "this is the best idea ever"
And I uncheck "Make Private"
And I press "Save and Post"
Then I should be on the idea page for the idea with title "awesome new idea"
And I should see "this is the best idea ever"


Scenario: Unapproved user cannot see private ideas
Given that the following idea exists:
| title                 | user_id          | privacy      |
| awesome new idea      | 1                | private      |

Given I am on the home page
When I fill in "user_username_login" with "testuser2"
And I fill in "user_password_login" with "1234"
And I press "Login"
#Given I have logged in to Brainstormy with username "testuser2"
And I am on the idea page for the idea with title "awesome new idea"
Then I should see "You do not have permission to access this idea"

Scenario: Approved user can see private ideas
Given the following idea exists:
| title                 | user_id          | privacy      | 
| awesome new idea      | 1                | private      | 

Given I am on the home page
When I fill in "user_username_login" with "testuser3"
And I fill in "user_password_login" with "1234"
And I press "Login"
And testuser3 has been added as a collaborator to the idea with title "awesome new idea"
#And I have logged in to Brainstormy with username "testuser3"
And I am on the idea page for the idea with title "awesome new idea"
Then I should see "awesome new idea"

Scenario: Try to add collaborator that doesn't exist (sad path)

Given that the following idea exists:
| title                 | user_id          |
| awesome new idea      | 1                |
Given I am on the home page
When I fill in "user_username_login" with "testuser"
And I fill in "user_password_login" with "1234"
And I press "Login"
Given I am now on the edit page for idea with title "awesome new idea"
Then I fill in "collaborator" with "testuserX"
And I press "Add Collaborator"
Then I will be on the edit page for idea with title "awesome new idea"
Then I should see "User testuserX does not exist"


Scenario: Try to add collaborator is already a collaborator (sad path)

Given that the following idea exists:
| title                 | user_id          |
| awesome new idea      | 1                |
Given I am on the home page
When I fill in "user_username_login" with "testuser"
And I fill in "user_password_login" with "1234"
And I press "Login"
Given I am now on the edit page for idea with title "awesome new idea"
Then I fill in "collaborator" with "testuser3"
And I press "Add Collaborator"
Then I will be on the edit page for idea with title "awesome new idea"
#Then I should not see "testuserX"
Then I fill in "collaborator" with "testuser3"
And I press "Add Collaborator"
Then I will be on the edit page for idea with title "awesome new idea"
And I should see "User testuser3 already added to Collaborators."

Scenario: Delete a collaborator
Given that the following idea exists:
| title                 | user_id          |
| awesome new idea      | 1                |
Given testuser3 has been added as a collaborator to the idea with title "awesome new idea"
Given I am on the home page
When I fill in "user_username_login" with "testuser"
And I fill in "user_password_login" with "1234"
And I press "Login"
Given I am now on the edit page for idea with title "awesome new idea"
Then I click the 'x' next to "Jess Doe"
Then I will be on the edit page for idea with title "awesome new idea"
Then I should see "Jess Doe deleted from subscribers"


