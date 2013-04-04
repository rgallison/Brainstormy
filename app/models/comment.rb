class Comment < ActiveRecord::Base
	attr_accessible :text, :rank, :user_id, :idea_id, :created_on
	belongs_to :user #user that posted comment
	belongs_to :idea #idea to which comment was posted
end