class Comment < ActiveRecord::Base
	attr_accessible :text, :rank, :date
end