source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record
gem 'sqlite3', group: :development

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer'# , platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# For ui and javascript stuff
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git', :branch => 'bootstrap3'

# Using simple_form to create rails form
gem 'simple_form'


# FOR USERS ======================================================

	# Gem to connect with your repos through OAuth2
	gem 'omniauth-github'
	gem 'omniauth-bitbucket'

	# Using devise to make the user able to login/signup
	gem 'devise', '~> 3.0.4'

#=================================================================

# FOR DEPLOYMENTS MODEL ==========================================

	# Accessing github's api
	# gem 'github_api'

	# Accessing bitbucket's api
	gem 'bitbucket_rest_api', :path => '~/projects/bitbucket' #, :git => 'git://github.com/alessiosantocs/bitbucket.git'

#=================================================================

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end


# FOR DEVELOPMENT  ===============================================

	group :development do 
		# Get better raise errors
		gem "better_errors"
		# And let me inspect them
		gem "binding_of_caller"
	end

#=================================================================

# FOR PRODUCTION  ================================================

	group :production do 
		gem 'rails_12factor'
		gem 'pg'
	end

#=================================================================

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
