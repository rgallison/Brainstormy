# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = [{:username => 'jsmith', :name => 'John Smith', :email => 'jsmith@gmail.com', :password => 'pengu1ns'},
		{:username => 'kRobenson', :name => 'Kate Robenson', :email => 'kRobenson@gmail.com', :password => '1q1q1q1'},
		{:username => 'pKing', :name => 'Patty King', :email => 'pKing@gmail.com', :password => 'pa33wOrd'},
		{:username => 'rJackson', :name => 'Ryan Jackson', :email => 'rjackson@gmail.com', :password => '4rrt49j'},
		{:username => 'cRaylon', :name => 'Cindy Raylon', :email => 'cRaylon', :password => 'spot886'}]

ideas = [{:title => 'A site that matches wines to meals', :rank => 54, :status => 'new', :privacy => 'public', :user_id => 2},
		{:title => 'A business that produces knitted hats', :rank => 104, :status => 'complete', :privacy => 'private', :user_id => 5},
		{:title => 'An app that tracks useage', :rank => 30, :status => 'prototype', :privacy => 'public', :user_id => 1},
		{:title => 'A website that explores the ocean at 1000 ft', :rank => 26, :status => 'fledging', :privacy => 'public', :user_id => 2},
		{:title => 'A product for pet owners', :rank => 77, :status => 'new', :privacy => 'public', :user_id => 4}]

comments = [{:text => 'I like that', :rank => 2, :user_id => 2, :idea_id =>2},
			{:text => 'how about a virtual tour', :rank => 10, :user_id => 1, :idea_id => 4},
			{:text => 'A place for divers to upload pictures', :rank => 23, :user_id => 3, :idea_id => 4},
			{:text => 'should include hats that create an illusion of some object', :rank => 6, :user_id => 1, :idea_id => 2},
			{:text => 'What about hats to match tv show characters?', :rank => 44, :user_id => 5, :idea_id => 2}]

messages = [{:subject => "Meeting time", :message => "We should meet up at 9 on Friday", :status => "unread", :sender => 1},
			{:subject => "Boss man?", :message => "Have you run it by the boss man yet?", :status => "read", :sender => 2}]

comments = [{:text => 'Insert awesome comment here', :user_id => 2, :idea_id=>2},
  {:text => 'I think that is so awesome', :user_id => 1, :idea_id =>4},
  {:text => 'A place for divers to upload pictures', :user_id => 3, :idea_id => 4},
  {:text => 'should include hats that create an illusion of some object', :user_id => 1, :idea_id => 2},
  {:text => 'What about hats to match tv show characters?', :user_id => 5, :idea_id => 2},
  {:text => 'Trollish Laughter', :user_id => 4, :idea_id => 5}]

User.send(:attr_accessible, :username, :name, :email, :password)
users.each do |user|
  User.create!(user)
end

Idea.send(:attr_accessible, :title, :rank, :status, :privacy, :user_id)
ideas.each do |idea|
  Idea.create!(idea)
end

Message.send(:attr_accessible, :subject, :message, :status, :sender)
messages.each do |message|
	Message.create!(message)
end

Comment.send(:attr_accessible, :text, :rank, :user_id, :idea_id)
comments.each do |comment|
  Comment.create!(comment)
end
