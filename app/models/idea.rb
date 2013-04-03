class Idea < ActiveRecord::Base
	attr_accessible :title, :description, :rank, :date, :status, :privacy
	belongs_to :user
	has_many :comments
end