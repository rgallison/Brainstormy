#Colin
Feature: add tags

As an idea creator
So that I can make my idea searchable to interested users
I want to add topic tags to my idea
Background: A user account has been created
Given the following user exists:
| username                 | name          | email           | password |
| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |

#Background: An idea has been created by the user
#Given that the following idea exists:
#| title                 | user_id          |
#| awesome new idea      | 1                |

Scenario: add a tag to the idea
Given I am on the home page
When I fill in "user_username_login" with "testuser"
And I fill in "user_password_login" with "1234"
And I press "Login"
Given PENDING: I am on the idea page for the idea with title "awesome new idea"
And I press "Add Tag"
Then I should see "Enter your tag:"
And I fill in "Enter your tag:" with "teleportation"
Then I press "Add tag"
Then I should "teleportation"


Scenario: click on a tag to see related ideas
Given that the following ideas exist:
| title                 | user_id          | 
| awesome new idea      | 1                |
| pretty bad idea       | 1                |
Given I am on the home page
When I fill in "user_username_login" with "testuser"
And I fill in "user_password_login" with "1234"
And I press "Login"
Given PENDING: I am on the idea page for the idea with title "awesome new idea"
And I follow "teleportation"
Then I should be on the search page
And I should see 

