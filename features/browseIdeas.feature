Feature:  User can browse though all ideas with a public privacy setting

Scenario:  Browse all ideas
	Given I am on the Brainstomry home page
	I should see a list of ideas

Scenario: Browse all ideas by User1
	Given I am on the Brainstormy home page
	When I fill in "Search" with "User1"
	And I press "Search"
	Then I should be on the Brainstormy home page
	And I should see a list of ideas by "User1"

Scenario:  Browse all ideas by User2, who doesn't exist(sad path)
	Given that I am on the Brainstormy home page
	When I fill in "Search" with "User2"
	And press "Search"
	Then I should be on the Brainstormy home page
	And I should see "There are no such ideas."

Scenario: Browse all ideas by the tag, "Tag1"
	Given I am on the Brainstormy home page
	When I fill in "Search" with "Tag2"
	And I press "Search"
	Then I should be on the Brainstormy home page
	And I should see "There are no such ideas."

Scenario:  Browse all ideas by "Tag2", that doesn't exist(sad path)
	Given that I am on the Brainstormy home page
	When I fill in "Search" with "Tag2"
	And press "Search"
	Then I should be on the Brainstormy home page
	And I should see "There are no such ideas."