require 'spec_helper'

describe IdeasController do


	describe 'add new idea' do
    	before :each do
     	 @fake_results = [mock('idea1')]
    	end

		it 'should call the model method that creates a new idea' do
			Idea.should_receive(:create!).with('super fake idea').and_return(@fake_results)
			post :create, {:title => 'super fake idea', :user}
		end

	end

end