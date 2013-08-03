# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Brainstormy::Application.initialize!

#File upload: skater coder
Rails::Initializer.run do |config|

  config.gem 'mime-types', :lib => 'mime/types'
  config.gem 'paperclip' 

  %w(middleware).each do |dir| 
    config.load_paths << "#{RAILS_ROOT}/app/#{dir}" 
  end
end
