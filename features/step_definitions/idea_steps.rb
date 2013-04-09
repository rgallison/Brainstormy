
#Note: When using regexp "([^"]*)" use this instead "([^\"]*)"
#This includes the backslash to escape the " and maintain the correct color

Given /^PENDING/ do
  pending
end


Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Given /the following user exists/ do |user_table|
  user_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    User.create(user)
  end
end

#Colin added on 4/8:
Given /the following idea exists/ do |idea_table|
  idea_table.hashes.each do |idea|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Idea.create(idea)
  end
end

When /^(?:|I )fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )press "([^\"]*)"$/ do |button|
  click_button(button)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
	visit path_to(page_name)
end

Then /^(?:|I )should be on "([^\"]*)" profile page/ do |username|
  user = User.find(:username => username)
  assert_equal "/users/#{user.id}", URI.parse(current_url).path
end

#Colin for new idea feature:
Given /^I am now on the edit page for idea with title "([^\"]*)"$/ do |idea_title|
  idea = Idea.find_by_title(idea_title)
  #assert_equal "/ideas/#{idea.id}/edit", URI.parse(current_url).path
  visit path_to('the edit page for idea number '+(idea.id).to_s)
end

Given /^I should be on the idea page for idea with title "([^\"]*)"$/ do |idea_title|
  idea = Idea.find_by_title(idea_title)
  #assert_equal "/ideas/#{idea.id}/edit", URI.parse(current_url).path
  visit path_to('the idea page for idea number '+(idea.id).to_s)
end


#Rachel for edit profile features
Given /^"([^\"]*)" is an image$/ do |image|
end

#Rachel
Then /^(?:|I )should see "([^\"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end



#Colin added on 4/8:
Then /^I should be on the idea page for the idea: "([^\"]*)"$/ do |idea_title|
  idea = Idea.find_by_title(idea_title)
  assert_equal "/ideas/#{idea.id}", URI.parse(current_url).path
end

#Colin added on 4/8:
 When /^(?:|I )uncheck "([^"]*)"$/ do |field|
   uncheck(field)
 end

#Colin added on 4/8:
 Given /^I have logged in to Brainstormy with username "([^\"]*)"$/ do |username|
  user=User.find_by_username(username)
  @current_user=user
  cookies[:user]=@current_user.id
end
