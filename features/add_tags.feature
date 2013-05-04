#Colin
Feature: add tags

As an idea creator
So that I can make my idea searchable to interested users
I want to add topic tags to my idea
Background: A user account has been created
Given the following user exists:
| username                 | name          | email           | password |
| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |


Scenario: add a tag to the idea
Given that the following idea exists:
| title                 | user_id          |
| awesome new idea      | 1                |
Given I am on the home page
When I fill in "user_username_login" with "testuser"
And I fill in "user_password_login" with "1234"
And I press "Login"
Given I am now on the edit page for idea with title "awesome new idea"
And I fill in "tag" with "teleportation"
Then I press "Add Tag"
Then I will be on the edit page for idea with title "awesome new idea"
Then I should see "teleportation"


Scenario: click on a tag to see related ideas
Given the following ideas exist:
| title                 | user_id          | privacy  |
| awesome new idea      | 1                | public   |
| pretty bad idea       | 1                | public   |
| mediocre idea         | 1                | public   |
And the idea "awesome new idea" has been tagged with "teleportation"
And the idea "mediocre idea" has been tagged with "teleportation"
Given I am on the home page
When I fill in "user_username_login" with "testuser"
And I fill in "user_password_login" with "1234"
And I press "Login"
Given I am on the idea page for the idea with title "mediocre idea"
And I follow "teleportation"
Then I should now be on the home page
And I should see "awesome new idea"
And I should see "mediocre idea"
And I should not see "pretty bad idea"

