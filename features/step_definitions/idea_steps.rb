
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

#Rachel for edit profile features
Given /^"([^\"]*)" is an image$/ do |image|
end

Then /^(?:|I )should see "([^\"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

#Colin for new idea feature:
Then /^I should be on the edit page for the idea: "([^\"]*)"$/ do |idea_title|
  idea = Idea.find_by_title(idea_title)
  assert_equal "/ideas/#{idea.id}", URI.parse(current_url).path
end
