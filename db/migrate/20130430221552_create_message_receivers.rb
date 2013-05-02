class CreateMessageReceivers < ActiveRecord::Migration
def change
  	create_table :messages_users do |t|
  		t.string :message_id
  		t.integer :user_id
  	end
  end
end

