class User < ActiveRecord::Base
	attr_accessible :username, :name, :email, :password
	has_many :comments #comments user has posted on ideas
	has_many :commented_ideas, :class_name => 'Idea', :through => :comments #ideas user has commented on
	has_many :ideas #ideas user has posted
end