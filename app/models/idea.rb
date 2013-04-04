class Idea < ActiveRecord::Base
	attr_accessible :title, :description, :rank, :user_id, :status, :privacy, :created_on, :updated_on
	belongs_to :user
	has_many :comments, :as => :userOn
end