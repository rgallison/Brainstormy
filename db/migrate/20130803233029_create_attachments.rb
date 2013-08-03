class CreateAttachments < ActiveRecord::Migration
  def change
  	create_table :attachments do |t|
      t.integer :attachable_id
      t.string :description  
      t.string :data_file_name  
      t.string :data_content_type  
      t.integer :data_file_size  
      t.datetime :data_updated_at
      t.datetime :data_created_at
      t.string :parent  
      t.timestamps
    end
  end
end
