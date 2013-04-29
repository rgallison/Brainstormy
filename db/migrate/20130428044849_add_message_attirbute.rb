class AddMessageAttirbute < ActiveRecord::Migration
  def change
  	add_column :messages, :status, :string
  	add_column :messages, :sender, :integer
  	add_column :messages, :parent, :integer
  	add_column :messages, :child, :integer
  end
end
