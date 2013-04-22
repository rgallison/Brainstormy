#Renee
Feature: Sign up to the site

As a potiential user
So that I can use the site
I want to create an account

Scenario: Sign up for Brainstormy

Given that I am on the home page
When I fill in "user_username" with "testuser"
And I fill in "user_name" with "Jane Doe"
And I fill in "user_email" with "jdoe@gmail.com"
And I fill in "user_email_confirmation" with "jdoe@gmail.com"
And I fill in "user_password" with "1234"
And I fill in "user_password_confirmation" with "1234"
And I press "Sign Up"
Then I should be on the "testuser" profile page

