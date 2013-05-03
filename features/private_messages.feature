#Renee

Feature: So that I can send and recieve private messages

Background: Two users have joined the site
	Given the following user exists:
	| username                 | name          | email           | password |
	| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |
	| testuser2                | John Doe      | jdoe@gmails.com | spot4    |
	And the following messages exist:
	| subject                  | message                                    |
	| message1                 | this is a message                          |
	| message2                 | this is another message				    |
	And I am on the home page
	And I fill in "user_username_login" with "testuser"
	And I fill in "user_password_login" with "1234"
	And I press "Login"

Scenario: So that I can see the messages I have recieved
	Given PENDING: that I am on the "testuser" messages page
	Then I should see "message1"

Scenario: So that I can send a message
	Given PENDING: that I am on the "testuser" messages page
	When I press "New Message"
	And I am on the new message page
	And I fill in "user" with "testuser2"
	And I fill in "subject" with "message3"
	And I fill in "message" with "yet another message"
	And I press "Send"
	Then I should be on the "testuser" message page
	And I should see "Message successfully sent."

Scenario: So that I can read a given message
	Given PENDING: that I am on the "testuser" messages page
	And I see "message1"
	When I follow "message1"
	Then I should be on the "message1" message page
	And I should see "this is a message"

Scenario: So that I can reply to a given message
	Given PENDING: that I am on the "testuser" messages page
	And I follow "message1"
	And I am on the "message1" message page
	When I press "Reply"
	Then I should be on the new message page
	And I should see "testuser2"
	And i should see "Send"


Scenario: So that I can send someone a message after viewing their profile
	Given PENDING: that I am on the "testuser2" messages page
	When I press "Message"
	Then I should be on the new message page

Scenario: So that I know that I have unread messages
	Given PENDING: that I am on the Brainstormy home page
	And I have a new message
	Then I should see "mail_new.png"
