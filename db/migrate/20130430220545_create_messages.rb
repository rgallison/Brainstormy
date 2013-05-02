class CreateMessages < ActiveRecord::Migration
  def change
  	create_table :messages do |t|
  		t.text :body
  		t.string :subject
  		t.string :status
  		t.integer :sender
  		t.integer :parent
  		t.integer :child
      t.timestamps
  	end
  end
end
