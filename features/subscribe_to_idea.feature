#Colin

Feature: subscribe to an idea

As a user,
so that I can follow activities on ideas of interest
I want to subscribe to an idea

Background:
Given the following user exists:
| username                 | name          | email           | password |
| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |

Scenario: Subscribe to public idea
Given that the following idea exists:
| title                 | user_id          | privacy   |
| awesome new idea      | 1                | public    |
Given PENDING: I am on the home page
When I fill in "user_username_login" with "testuser"
And I fill in "user_password_login" with "1234"
And I press "Login"
Given I am now on the idea page for idea with title "awesome new idea"
And I click "Subscribe"
Then I should be on the idea page for the idea with title "awesome new idea"
And I should see "You are now subscribed to 'awesome new idea'"



