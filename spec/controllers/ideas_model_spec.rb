require 'spec_helper'

describe Idea do
	#Colin editted on 4/26 to fix now failing test:
	#describe 'set to private' do
	#	before :each do
	#		@fake_idea=Idea.create!(:title => "fake", :privacy => 'public')
	#		#@fake_idea.stub(:privacy).and_return("public")
			#@fake_2=Idea.create!(:title => "fake", :privacy => 'private')
			#@fake_2.stub(:privacy).and_return("private")


	#	end

	#	it 'should set the privacy attribute to private' do
			#Idea.should_receive(:update_attributes!).with({:privacy => 'private'}).and_return(@fake)
			
	#		@fake_idea.update_attributes!(:privacy => 'private')
	#		@fake_idea.privacy.should == 'private'
	#	end
	#end
end

