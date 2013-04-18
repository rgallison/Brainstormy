class User < ActiveRecord::Base
	attr_accessible :username, :name, :email, :email_confirmation, :password, :password_confirmation, :bio
	has_many :comments #comments user has posted on ideas
	has_many :commented_ideas, :through => :comments, :source => :idea #ideas user has commented on
	has_many :ideas #ideas user has posted
	has_many :messages #messages written

	#4/18 Colin added:
	has_and_belongs_to_many :collaborated_ideas, :class_name => 'Idea'

	validates :password, :email, :confirmation => true
	validates :username, :email, :password, :name, :presence => true
    # validates :username, :email, :unique => true
end
