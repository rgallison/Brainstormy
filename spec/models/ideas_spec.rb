require 'spec_helper'

describe Idea do

	it 'can create an idea' do
		user=User.create!(:username => 'testuser', :email => 'aa@qq.com', :name => "Dave Miller", :password => 'abcd')
		idea=Idea.create!(:title => 'test idea', :user_id => user.id)

		idea.title.should == 'test idea'

	end

	describe 'set to private' do
		before :each do
			@fake_idea=Idea.create!(:title => "fake", :privacy => 'public')
		end

		it 'should set the privacy attribute to private' do
			@fake_idea.update_attributes!(:privacy => 'private')
			@fake_idea.privacy.should == 'private'
		end
	end

end
