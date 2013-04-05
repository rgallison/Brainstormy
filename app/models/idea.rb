class Idea < ActiveRecord::Base
	attr_accessible :title, :description, :rank, :user_id, :status, :privacy, :created_on, :updated_on
	belongs_to :user #User who created the idea

	#4/4 Colin deleted : after :class_name (previously read ":class_name: => ")
	has_many :commented_users, :class_name => 'User', :through => :comments #users who commented
	has_many :comments #idea comments
end