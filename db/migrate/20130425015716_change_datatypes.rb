class ChangeDatatypes < ActiveRecord::Migration
  def change
  	remove_column :users, :bio
  	add_column :users, :bio, :text

  	remove_column :ideas, :description
  	add_column :ideas, :description, :text
  	remove_column :ideas, :rank
  	add_column :ideas, :rank, :integer
  end
end
