require 'spec_helper'

describe IdeasController do


	describe 'add new idea' do
    	before :each do
     	 @fake_results = mock('idea1')
     	 @fake_results.stub(:id).and_return(1)

    	end

		it 'should call the model method that creates a new idea' do
			Idea.should_receive(:create!).with({"title" => 'super fake idea', "user_id" => "1"}).and_return(@fake_results)
			post :create, {:idea => {:title => 'super fake idea'}, :user_id => 1}
		end

		it 'should call the Edit Idea controller method' do
			Idea.stub(:create!).and_return(@fake_results)
			post :create, {:idea => {:title => 'super fake idea', :user_id => 1}}
			response.should redirect_to('/ideas/1/edit')
		end


	end

	describe 'edit newly created idea' do
    	before :each do
     	 @new_idea = mock('idea1')
     	 @new_idea.stub(:id).and_return(1)
     	 @new_idea.stub(:user_id).and_return(3)
     	 @new_idea.stub(:title).and_return('super fake idea')	

     	 @user = mock('user1')
     	 @user.stub(:id).and_return(3)
     	end

		it 'should call the model method that finds an existing idea' do
			Idea.should_receive(:find).with(@new_idea.id.to_s).and_return(@new_idea)
			get :edit, {:id => @new_idea.id}
		end
		it 'should render the edit idea template' do
			Idea.stub(:find).and_return(@new_idea)
			get :edit, {:id => @new_idea.id}
			response.should render_template('edit')
		end

		it 'should make the correct idea available to the template' do
			Idea.stub(:find).and_return(@new_idea)
			get :edit, {:id => @new_idea.id}
			assigns(:idea).should == @new_idea
		end
		it 'should make the correct user available to the template' do
			User.stub(:find_by_id).and_return(@user)
			Idea.stub(:find).and_return(@new_idea)
			get :edit, {:id => @new_idea.id}
			assigns(:user).should == @user
		end		


	end

	describe 'add a collaborator to an idea' do
    	before :each do
     	 #@new_idea = mock('idea1')
     	 #@new_idea.stub(:id).and_return(1)
     	 #@new_idea.stub(:user_id).and_return(3)
     	 #@new_idea.stub(:title).and_return('super fake idea')	
     	 @new_idea=mock_model(Idea).as_null_object
     	 @user = mock('user1')
     	 @user.stub(:id).and_return(3)
     	end

		it 'should call the model method to add a collaborator' do
			idea=mock_model(Idea).as_null_object
			#Idea.stub(:collaborators)
			Idea.stub(:find).and_return(@new_idea)
			User.stub(:find_by_username).and_return(@user)
			@new_idea.should_receive('collaborators<<').with(@user)
			post :update, {:collaborator => 'user1', :user_id => @user.id, :id => @new_idea.id}
		end
	end





end