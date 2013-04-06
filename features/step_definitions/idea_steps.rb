
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

#Rachel - added \ in between every ^ and " in the expression "([^"]*)"
# now things aren't being colored as a string when they're not supposed to be
# this shouldn't change anything- Willow told me about this
When /^(?:|I )fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )press "([^\"]*)"$/ do |button|
  click_button(button)
end