class CreateMessageReceivers < ActiveRecord::Migration
def change
  	create_table :messages_users do |t|
  		t.integer :message_id
  		t.integer :user_id
  	end
  end
end

