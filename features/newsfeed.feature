#christie
Feature: View ideas contributed to

As a user that has contributed to an idea,
So that I can view ideas I have contributed to
I want to see a list of ideas I have contributed to in my News Feed

Backgroud: I have contributed to an idea
Given the following users exists:
| username                 | name          | email           | password |
| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |
| testuser2                | Mark Doe      | mdoe@mills.edu  | 1234     |
| testuser3				   | Jess Doe	   | jessdoe@mills.edu | 1234   |

Scenario: view ideas I have contributed to
Given that the following idea exists:
| title                 | user_id          |
| amazing idea          | 1                |
| super amazing idea    | 2                |
| fantastic idea        | 1                |

Given PENDING: I am on my profile page
Then I should see "amazing idea"
And I should see "super amazing idea"
And I should see "fantastic idea"

Scenario: idea I have contributed to has been commented on by another user

Given PENDING: I am on my profile page
And another user has commented on "amazing idea"
Then I should see "amazing idea" as the first idea on my list
And "amazing idea" should be highlighted


