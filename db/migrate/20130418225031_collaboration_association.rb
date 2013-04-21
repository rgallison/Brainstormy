class CollaborationAssociation < ActiveRecord::Migration
  def up
  	create_table :ideas_users do |t|
  		t.integer :user_id
  		t.integer :idea_id
  	end

  end

  def down
  	drop_table :ideas_users
  end
end
