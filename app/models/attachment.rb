class Attachment < ActiveRecord::Base
	belongs_to :attachable, :polymorphic => true
	has_attached_file :attachment, :styles => { :large => "800x800", :medium => "400x400>", :small => "200x200>" }, :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"

	attr_accessible :attachment, :attachment_file_name, :title, :description, :idea_id
end
