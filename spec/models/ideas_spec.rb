require 'spec_helper'

describe Idea do

	it 'can create an idea' do
		user=User.create!(:username => 'testuser')
		idea=Idea.create!(:title => 'test idea', :user_id => user.id)

		idea.title.should == 'test idea'

	end

end
