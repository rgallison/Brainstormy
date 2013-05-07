require 'spec_helper'

describe User do
	
	describe 'adding a model instance' do
		before :each do
			@fake = mock("testuser")
		end

		it 'should add a new user to the database' do
			User.should_receive(:create!).with('username' => 'testUser', 'user_id' => "1").and_return(true)
			User.create!(@fake)
			# post :create, {:user => {:username => 'fake user', :user_id => 1}}
		end

	end

end