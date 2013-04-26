#Christie 4/24/13

Feature: display list of movies sorted by different criteria
 
  As a user
  So that I can quickly browse ideas based on my preferences
  I want to see ideas sorted by title or rank
Background: ideas have been added to database
  
Given that the following idea exists:
| title                 | user_id          | rank
| amazing idea          | 1                | 45
| super amazing idea    | 2                | 2
| fantastic idea        | 1                | 32

Scenario: sort ideas alphabetically by title
  Given PENDING: I am on the home page
  When I follow "Sort by Title"
  Then I should see "amazing idea" before "fantastic idea"
  And I should see "fantastic idea" before "super amazing idea"

Scenario: sort ideas in decreasing order by rank
  Given PENDING: I am on the home page
  When I follow "Sort by Rank"
  Then I should see "amazing idea" before "fantastic idea"
  And I should see "fantastic idea" before "super amazing idea"
