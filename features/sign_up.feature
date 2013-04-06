Feature: Sign up to the site

As a potiential user
So that I can use the site
I want to create an account

Scenario: Sign up for Brainstormy

Given I am on the Brainstormy home page
When I fill in "firstName" with "John"
And I fill in "lastName" with "Adams"
And I fill in "email" with "jadams@gmail.com"
And I fill in "email2" with "jadams@gmail.com"
And I fill in "password" with "spot1234"
And I fill in "password2" with "spot1234"
And I press "Sign Up"
Then I should be on the profile page