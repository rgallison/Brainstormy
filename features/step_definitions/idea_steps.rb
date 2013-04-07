
#Note: When using regexp "([^"]*)" use this instead "([^\"]*)"
#This includes the backslash to escape the " and maintain the correct color


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
