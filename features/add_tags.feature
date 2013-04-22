#Colin
Feature: add tags

As an idea creator
So that I can make my idea searchable to interested users
I want to add topic tags to my idea

Background: an idea exists
Given that the following idea exists:
| title                 | user_id          |
| awesome new idea      | 1                |

Scenario: add a tag to the idea
Given PENDING: I am on the idea page for the idea with title "awesome new idea"
And I press "Add Tag"
Then I should see "Enter your tag:"
And I fill in "Enter your tag:" with "teleportation"
Then I press "Add tag"
Then I should "teleportation"

