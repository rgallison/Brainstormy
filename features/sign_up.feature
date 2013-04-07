Feature: Sign up to the site

As a potiential user
So that I can use the site
I want to create an account

Scenario: Sign up for Brainstormy

Given I am on the home page
When I fill in "user_firstName" with "John"
And I fill in "user_lastName" with "Adams"
And I fill in "user_email" with "jadams@gmail.com"
And I fill in "user_email2" with "jadams@gmail.com"
And I fill in "user_password" with "spot1234"
And I fill in "user_password2" with "spot1234"
And I press "Sign Up"
Then I should be on the profile page