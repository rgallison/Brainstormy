class AddFileToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :file, :string
  end
end
