require 'spec_helper'

describe Idea do

	describe 'set to private' do
		before :each do
			@fake_idea=Idea.mock("fake")
			@fake_idea.stub(:privacy).and_return("public")
			@fake_2=Idea.mock('fake 2')
			@fake_2.stub(:privacy).and_return("private")

		end

		it 'should set the privacy attribute to private' do
			#Idea.should_receive(:update_attributes!).with({:privacy => 'private'}).and_return(@fake)
			
			@fake_idea.update_attributes!(:privacy => 'private').should == @fake_2
		end
	end
end

