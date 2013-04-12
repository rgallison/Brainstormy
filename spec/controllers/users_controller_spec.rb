require 'spec_helper'

describe UsersController do

	describe 'add new user' do
		before :each do
			@fake_results = mock('user')
			@fake_results.stub(:id).and_return(1)
		end

		it 'should call the action that creates a new user' do
			User.should_receive(:create!).with('username' => 'fake user', 'user_id' => "1").and_return(@fake_results)
			post :create, {:user => {:username => 'fake user', :user_id => 1}}
		end
	end
end
	# describe 'display user info' do
	# 	before :each do
 #     		@fake_results = [mock('user1')]
 #    	end
	# 	it 'should call the model method that finds a user in the database' do
	# 		User.should_receive(:find).with('fake user id').and_return(@fake_results)
	# 		post :create, {:user_id => 'fake user id'}





