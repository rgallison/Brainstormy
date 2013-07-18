source 'https://rubygems.org'

#6/13 rg: file upload
gem 'carrierwave', '>= 0.5.3'
gem "rmagick"#, :require => 'RMagick'
# gem 'nested_form'
gem "jquery-fileupload-rails"
#6/12  rg: validation errors
# gem 'dynamic_forms'

gem 'rails', '3.2.13'
gem 'haml' #support haml -RG, 3/20
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'acts_as_votable', '~> 0.5.0'
# gem 'acts_as_commentable_with_threading'
gem 'simplecov'

#for iter 1-2.  to support BDD and TDD.  rg
group :test, :development do
	gem 'ZenTest', '~> 4.4.2'
	gem 'rspec-rails','~> 2.0'
	gem 'database_cleaner'
	# gem 'capybara'
	gem 'launchy'
	gem 'sqlite3'
end

group :test do
	gem 'cucumber-rails'
	gem 'cucumber-rails-training-wheels'
end

group :production do
  gem 'pg', '~> 0.14.1'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'debugger'
