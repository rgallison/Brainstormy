class User < ActiveRecord::Base
	attr_accessible :username, :name, :email, :email_confirmation, :password, :password_confirmation, :bio
	has_many :comments #comments user has posted on ideas
	has_many :commented_ideas, :class_name => 'Idea', :through => :comments #ideas user has commented on
	has_many :ideas #ideas user has posted

	validates :password, :email, :confirmation => true
	validates :username, :email, :password, :name, :presence => true
end
