class RemoveColumnFromComment < ActiveRecord::Migration
  def change
  	remove_column :comments, :comment_id
  end
end
