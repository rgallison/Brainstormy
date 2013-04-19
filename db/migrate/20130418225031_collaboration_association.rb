class CollaborationAssociation < ActiveRecord::Migration
  def up
  	create_table :ideas_users do |t|
  		t.string :user_id
  		t.string :idea_id
  	end

  end

  def down
  	drop_table :ideas_users
  end
end
