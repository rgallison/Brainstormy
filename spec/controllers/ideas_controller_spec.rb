require 'spec_helper'

describe IdeasController do


	describe 'add new idea' do
    	before :each do
     	 @fake_results = mock('idea1')
     	 @fake_results.stub(:id).and_return(1)
    	end

		it 'should call the model method that creates a new idea' do
			Idea.should_receive(:create!).with({"title" => 'super fake idea', "user_id" => "1"}).and_return(@fake_results)
			post :create, {:idea => {:title => 'super fake idea', :user_id => 1}}
		end

		it 'should call the Edit Idea controller method' do
			Idea.stub(:create!).and_return(@fake_results)
			post :create, {:idea => {:title => 'super fake idea', :user_id => 1}}
			response.should redirect_to('/ideas/1/edit')
		end

	end

end