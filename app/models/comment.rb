class Comment < ActiveRecord::Base
	attr_accessible :text, :rank, :user_id, :idea_id, :created_on
	belongs_to :userOn, :polymorphic => true
end