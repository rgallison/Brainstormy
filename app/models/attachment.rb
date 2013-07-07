class Attachment < ActiveRecord::Base
  attr_accessible :title, :file
  # belongs_to :comment
  belongs_to :attachable, :polymorphic => true
  belongs_to :idea
  include Rails.application.routes.url_helpers
  mount_uploader :file, FileUploader

  def to_jq_upload
    {
      "name" => read_attribute(:file),
      "size" => file.size,
      "url" => file.url,
      "thumbnail_url" => file.thumb.url,
      "delete_url" => attachment_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end
end
