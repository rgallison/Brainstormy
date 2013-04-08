Feature:  User can browse though all ideas with a public privacy setting

Given the following user exists:
| username                 | name          | email           | password |
| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |
| testuser2                | John Doe      | jdoe@gmails.com | spot4    |


Scenario:  Browse all ideas
	Given PENDING: I am on the home page
	Then I should see a list of ideas

Scenario: Browse all ideas by User1
	Given PENDING: I am on the home page
	When I fill in "Search" with "testuser
	And I press "Search"
	Then I should be on the home page
	And I should see a list of ideas by "testuser

Scenario:  Browse all ideas by User2, who doesn't exist(sad path)
	Given PENDING: that I am on the home page
	When I fill in "Search" with "testuser2"
	And press "Search"
	Then I should be on the home page
	And I should see "There are no such ideas."

Scenario: Browse all ideas by the tag, "Tag1"
	Given PENDING: I am on the home page
	When I fill in "Search" with "Tag2"
	And I press "Search"
	Then I should be on the home page
	And I should see "There are no such ideas."

Scenario:  Browse all ideas by "Tag2", that doesn't exist(sad path)
	Given PENDING: that I am on the home page
	When I fill in "Search" with "Tag2"
	And press "Search"
	Then I should be on the Brainstormy home page
	And I should see "There are no such ideas."