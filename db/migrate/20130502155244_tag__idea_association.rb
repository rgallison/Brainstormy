class TagIdeaAssociation < ActiveRecord::Migration
  def up
  	create_table :ideas_tags do |t|
  		t.integer :idea_id
  		t.integer :tag_id
  	end  	
  end

  def down
  	drop_table :ideas_tags
  end
end
