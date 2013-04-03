class Comment < ActiveRecord::Base
	attr_accessible :text, :rank
	belongs_to :userOn, :polymorphic => true
end