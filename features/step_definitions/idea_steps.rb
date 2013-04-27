#Note: When using regexp "([^"]*)" use this instead "([^\"]*)"
#This includes the backslash to escape the " and maintain the correct color

Given /^PENDING/ do
  pending
end

Given /^(?:|that I |I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Given /the following user(?:|s) exist(?:|s)/ do |user_table|
  user_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    User.create!(user)
  end
end

#Colin added on 4/8:
Given /the following idea exists/ do |idea_table|
  idea_table.hashes.each do |idea|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Idea.create!(idea)
  end
end

When /^(?:|that I |I )fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|that I |I )press "([^\"]*)"$/ do |button|
  click_button(button)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
	visit path_to(page_name)
end

# Then /^(?:|I )should be on "([^\"]*)" profile page/ do |username|
#   user = User.find(:username => username)
#   assert_equal "/users/#{user.id}", URI.parse(current_url).path
# end

#Colin for new idea feature:
Given /^(?:|that I |I )am now on the edit page for idea with title "([^\"]*)"$/ do |idea_title|
  idea = Idea.find_by_title(idea_title)
  #assert_equal "/ideas/#{idea.id}/edit", URI.parse(current_url).path
  visit path_to('the edit page for idea number '+(idea.id).to_s)
end

#Colin added 4/19 for customize_idea feature:
Then /^(?:|that I |I )will be on the edit page for idea with title "([^\"]*)"$/ do |idea_title|
  idea = Idea.find_by_title(idea_title)
  #assert_equal "/ideas/#{idea.id}/edit", URI.parse(current_url).path
  current_path.should == path_to('the edit page for idea number '+(idea.id).to_s)
end

Given /^(?:|that I |I ) should be on the idea page for idea with title "([^\"]*)"$/ do |idea_title|
  idea = Idea.find_by_title(idea_title)
  #assert_equal "/ideas/#{idea.id}/edit", URI.parse(current_url).path
  current_path.should == path_to('the idea page for idea number '+(idea.id).to_s)
end


#Rachel for edit profile features
Given /^"([^\"]*)" is an image$/ do |image|
end

#Rachel for edit profile features
Then /^(?:|I )should see "([^\"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

#Find a list of text on a page -rg 4/13
Then /^I should see the following: "([^\"]*)"/ do |text_list|
  text_list.split('", "').each do |text|
    if page.respond_to? :should
      page.should have_content(text)
    else
      assert page.has_content(text)
    end
  end
end


#Colin added on 4/8:
Then /^(?:|that I |I )should be on the idea page for the idea: "([^\"]*)"$/ do |idea_title|
  idea = Idea.find_by_title(idea_title)
  assert_equal "/ideas/#{idea.id}", URI.parse(current_url).path
end

#Colin added on 4/8:
 When /^(?:|that I |I )uncheck "([^\"]*)"$/ do |field|
   uncheck(field)
 end

#Colin added on 4/8: broken?
 Given /^(?:|that I |I )have logged in to Brainstormy with username "([^\"]*)"$/ do |username|
  user=User.find_by_username(username)
  cookies[:user] = user.id
  @current_user = cookies[:user]
end

#Colin added on 4/12 for customize_idea.feature:
 And /^"([^\"]*)" has been added as a collaborator to the idea with title "([^\"]*)"$/ do |u, i|
   idea=Idea.find_by_title(i)
   user=User.find_by_username(u)
   idea.collaborators << user
 end

 #Colin added on 4/19:
 Then /^the following flash message will be displayed "([^\"]*)"$/ do |msg|
  flash.should contain msg
end


#Rachel for edit profile features
Then /^(?:|that I |I )should not see "([^\"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

#Lindsey Basic link following
When /^(?:|that I |I )follow "([^\"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|that I |I )go to (.+)$/ do |page_name|
 visit path_to(page_name)
end

#Christie for browse ideas feature
Then /^I should see a list of ideas/ do 
  assert page.all("table tbody tr").count.should == @pop_ideas.count
end

# And /^I should see a list of ideas by "([^\"]*)"$/ do |value|


#Rachel for seeing a link
Then /^(?:|that I |I )should see the link "([^\"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_link(text)
  else
    assert page.has_link?(text)
  end
end