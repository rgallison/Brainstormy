class CreateIdeas < ActiveRecord::Migration
  def up
  	create_table :ideas do |t|
      	t.string :title
     	t.integer :rank
      	t.string :status
      	t.string :privacy
      	t.integer :user_id
      	# Add fields that let Rails automatically keep track
      	# of when movies are added or modified:
      	t.timestamps
    end
  end

  def down
  	drop_table :ideas
  end
end
