class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.string :text
  		t.string :rank
  		t.integer :user_id
  		t.integer :idea_id
  		t.timestamps
  	end
  end
end
