# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    #Colin added:
    when /^the home\s?page$/
      '/'

    #Colin added 4/8 for create_ideas.feature:
    when /^the edit page for idea number (.+)$/
      edit_idea_path(Idea.find_by_id($1))
    when /^the idea page for the idea with title "([^\"]*)"$/
      idea_path(Idea.find_by_title($1))
    when /^the edit page for the idea "([^\"]*)"$/
      idea_path(Idea.find_by_title($1))

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    when /^the \"(.*)\" profile page$/i
      user_path(User.find_by_username($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
