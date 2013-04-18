class Idea < ActiveRecord::Base
	attr_accessible :title, :description, :rank, :user_id, :status, :privacy, :created_on, :updated_on
	belongs_to :user #User who created the idea

	#4/4 Colin deleted : after :class_name (previously read ":class_name: => ")
	#4/18 Colin commented out original collaborators association and replaced it with new one
	#has_many :collaborators, :class_name => 'User', :through => :comments #users who commented
	has_and_belongs_to_many :collaborators, :class_name => 'User'

	has_many :comments #idea comments
end