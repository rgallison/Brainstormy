class Attachment < ActiveRecord::Base
  attr_accessible :title, :file
  # belongs_to :comment
  belongs_to :attachable, :polymorphic => true
  belongs_to :idea
  mount_uploader :file, FileUploader
end
