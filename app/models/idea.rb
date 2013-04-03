class Idea < ActiveRecord::Base
	attr_accessible :title, :description, :rank, :status, :privacy, :date_created
	belongs_to :user
	has_many :comments
end