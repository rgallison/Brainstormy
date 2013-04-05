class CreateIdeas < ActiveRecord::Migration
  def change
  	create_table :ideas do |t|
      r.string :idea_id
  		t.string :title
  		t.string :description
  		t.string :rank
  		t.string :status
  		t.string :privacy
      t.integer :user_id
      t.timestamps
  	end	
  end
end