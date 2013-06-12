class User < ActiveRecord::Base
	attr_accessible :username, :name, :email, :email_confirmation, :password, :password_confirmation, :bio, :last_login
	has_many :comments #comments user has posted on ideas -rg
	has_many :commented_ideas, :through => :comments, :source => :idea #ideas user has commented on <The above may not be needed because of acts as commentable!
	has_many :ideas #ideas user has posted -rg
	has_many :messages #All messages sent? -rg 4/28
	has_and_belongs_to_many :received, :class_name => 'Message' #all messages received?
	#4/18 Colin added:
	has_and_belongs_to_many :collaborated_ideas, :class_name => 'Idea'

	validates :password, :email, :confirmation => true
	validates :username, :email, :password, :name, :presence => true
    validates :username, :email, :uniqueness => true
  	acts_as_voter
end
