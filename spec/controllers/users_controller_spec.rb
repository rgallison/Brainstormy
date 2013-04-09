require 'spec_helper'

describe UsersController do
	describe 'add new user' do
		it 'should call the model method that creates a new user' do
			User.should_receive(:create!).with('fake user').and_return(@fake_results)
			post :create, {:user => 'fake user'}
		end
	end

	# describe 'display user info' do
	# 	before :each do
 #     		@fake_results = [mock('user1')]
 #    	end
	# 	it 'should call the model method that finds a user in the database' do
	# 		User.should_receive(:find).with('fake user id').and_return(@fake_results)
	# 		post :create, {:user_id => 'fake user id'}



end

