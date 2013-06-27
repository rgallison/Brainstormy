class Idea < ActiveRecord::Base
	attr_accessible :title, :description, :rank, :user_id, :status, :privacy, :created_on, :updated_on, :suggested_files_by_owner_attributes, :is_private
	belongs_to :user #User who created the idea

	#4/4 Colin deleted : after :class_name (previously read ":class_name: => ")
	#4/18 Colin commented out original collaborators association and replaced it with new one
	#has_many :collaborators, :class_name => 'User', :through => :comments #users who commented
	has_and_belongs_to_many :collaborators, :class_name => 'User'

	#5/1 Colin added:
	has_and_belongs_to_many :tags

	has_many :comments #idea comments <no longer needed due to acts as commentable

	has_many :suggested_files_by_owner, :class_name => 'Attachment', :as => :attachable# all files submitted by owner of the idea
	has_many :suggested_files, :class_name => 'Attachment', :as => :attachable #all files suggested in idea and comments
	# has_many :final_file, :class_name => 'Attachment' #all files to include in final state
	accepts_nested_attributes_for :suggested_files_by_owner

	#validation
	validates :title, :presence => true

	# acts_as_commentable 

	def is_private
		privacy == 'private'
	end

	def is_private=(true_or_false)
    	self.privacy = true_or_false ? 'private' : 'public'
	end
end