#Renee

Feature: So that I can send and recieve private messages

Background: Two users have joined the site
	Given the following user exists:
	| username                 | name          | email           | password |
	| testuser                 | Jane Doe      | jdoe@mills.edu  | 1234     |
	| testuser2                | John Doe      | jdoe@gmails.com | spot4    |
	And the following messages exist:
	| subject                  | body	                | sender	| receiver	| status	|
	| message1                 | this is a message      | 2         | 1 		| unread	|
	| message2                 | this is another message| 1		    | 2			| read		|
	And I am on the home page
	And I fill in "user_username_login" with "testuser"
	And I fill in "user_password_login" with "1234"
	And I press "Login"

Scenario: So that I can see the messages I have recieved
	Given that I am on the messages page
	Then I should see "message1"

Scenario: So that I can send a message
	Given that I am on the messages page
	And I fill in "message_receiver" with "testuser2"
	And I fill in "message_subject" with "message3"
	And I fill in "message_body" with "yet another message"
	And I press "Send"
	And I should see "Message was successfully sent."

Scenario: So that I can read a given message
	Given that I am on the messages page
	And I see "message1"
	When I follow "message1"
	Then I should be on the "message1" message page
	And I should see "this is a message"

Scenario: So that I can reply to a given message
	Given that I am on the messages page
	And I follow "message1"
	And I am on the "message1" message page
	And I fill in "message_body" with "no more messages"
	And I press "Reply"
	Then I should see "Message was successfully sent."

Scenario: So that I know that I have unread messages
	Given that I am on the home page
	And I have a new message
	Then I should see the image "mail_new.png"
