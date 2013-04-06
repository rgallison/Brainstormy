class RemoveColumnFromIdea < ActiveRecord::Migration
  def change
  	remove_column :ideas, :idea_id
  end
end
