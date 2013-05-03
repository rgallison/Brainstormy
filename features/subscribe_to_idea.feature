#Colin

Feature: subscribe to an idea

As a user,
so that I can follow activities on ideas of interest
I want to subscribe to an idea

Background:
Given the following users exists:
| username                 | name          | email           | password |
| testuser_x               | Sam Doe       | sdoe@mills.edu  | 2234     |
| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |

Scenario: Subscribe to public idea
Given that the following idea exists:
| title                 | user_id          | privacy   |
| awesome new idea      | 1                | public    |
Given I am on the home page
When I fill in "user_username_login" with "testuser"
And I fill in "user_password_login" with "1234"
And I press "Login"
And I am on the idea page for the idea with title "awesome new idea"
And I follow "Subscribe to this idea"
Then I will be on the idea page for idea with title "awesome new idea"
And I should see "User testuser added to Subscribers"

Scenario: Already subscribed to an idea (sad path)
Given that the following idea exists:
| title                 | user_id          | privacy   |
| awesome new idea      | 1                | public    |
Given testuser has been added as a collaborator to the idea with title "awesome new idea"
Given I am on the home page
When I fill in "user_username_login" with "testuser"
And I fill in "user_password_login" with "1234"
And I press "Login"
And I am on the idea page for the idea with title "awesome new idea"
And I follow "Subscribe to this idea"
Then I will be on the idea page for idea with title "awesome new idea"
And I should see "User testuser already added to Subscribers"

Scenario: If not logged in, user cannot subscribe
Given that the following idea exists:
| title                 | user_id          | privacy   |
| awesome new idea      | 1                | public    |
Given I am on the idea page for the idea with title "awesome new idea"
Then I should not see "Subscribe to this idea"


