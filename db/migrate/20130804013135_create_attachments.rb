class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.attachment :attachment
      t.integer :attachable_id
      t.string :attachable_type
      t.integer :idea_id
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
