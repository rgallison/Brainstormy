require 'spec_helper'

describe CommentsController do
  describe 'PENDING: vote on comment' do
    it 'PENDING: should call the method that changes rank' do
    end#call the thing that changes rank
    it 'PENDING: should decrease rank by one' do
    end#downvote
    it 'PENDING: should increase rank by one' do
    end#upvote
    it 'PENDING: resort view' do
    end#resort
  end#describe upvoting and downvoting

	#Christie
	describe 'add new comment' do
    	before :each do
     	 @a_comment = mock('comment1')
     	 @a_comment.stub(:id).and_return(1)

    	end

		it 'PENDING: should call the model method that creates a new comment' do
			Idea.should_receive(:create!).with({"title" => 'fake comment', "user_id" => "1"}).and_return(@fake_results)
			post :create, {:comment => {:title => 'fake comment'}, :user_id => 1}
		end

	end
end#describe Comments Controller
