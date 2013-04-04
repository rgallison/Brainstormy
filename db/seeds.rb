# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = [{:user_id => '1', :username => 'jsmith', :name => 'John Smith', :email => 'jsmith@gmail.com', :password => 'pengu1ns'}
		{:user_id => '2', :username => 'kRobenson', :name => 'Kate Robenson', :email => 'kRobenson@gmail.com', :password => '1q1q1q1'}
		{:user_id => '3', :username => 'pKing', :name => 'Patty King', :email => 'pKing@gmail.com', :password => 'pa33wOrd'}
		{:user_id => '4', :username => 'rJackson', :name => 'Ryan Jackson', :email => 'rjackson@gmail.com', :password => '4rrt49j'}
		{:user_id => '4', :username => 'cRaylon', :name => 'Cindy Raylon', :email => 'cRaylon', :password => 'spot886'}]

ideas = [{:idea_id => , :title => , :description => , :rank =>, :status => , :privacy => , :user_id => }
		{:idea_id => , :title => , :description => , :rank =>, :status => , :privacy => , :user_id => }
		{:idea_id => , :title => , :description => , :rank =>, :status => , :privacy => , :user_id => }
		{:idea_id => , :title => , :description => , :rank =>, :status => , :privacy => , :user_id => }
		{:idea_id => , :title => , :description => , :rank =>, :status => , :privacy => , :user_id => }]

comments = [{:comment_id => , :text => , :rank => , :userOn_id => , :userOn_type => }
			{:comment_id => , :text => , :rank => , :userOn_id => , :userOn_type => }
			{:comment_id => , :text => , :rank => , :userOn_id => , :userOn_type => }
			{:comment_id => , :text => , :rank => , :userOn_id => , :userOn_type => }
			{:comment_id => , :text => , :rank => , :userOn_id => , :userOn_type => }]