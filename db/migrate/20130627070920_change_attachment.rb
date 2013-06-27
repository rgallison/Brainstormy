class ChangeAttachment < ActiveRecord::Migration
  def change
  	remove_column :attachments, :idea_id
  	add_column :attachments, :title, :string
  	add_column :attachments, :attachable_id, :integer
  	add_column :attachments, :attachable_type, :string
  end
end
