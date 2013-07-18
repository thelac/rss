source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'nokogiri'
gem 'twitter-bootstrap-rails', :git => 'http://github.com/seyhunak/twitter-bootstrap-rails.git'
gem "feedzirra", "~> 0.2.0.rc2", :git => 'git://github.com/pauldix/feedzirra.git'
gem 'jquery-ui-rails'
gem 'whenever', require: false

## Social integration
gem 'omniauth'
gem 'omniauth-twitter'
gem 'twitter'

gem 'omniauth-pocket'
gem 'getpocket', github: 'elomar/pocket_api', require: 'pocket_api'

gem 'omniauth-readability', github: '29decibel/omniauth-readability'
gem 'readit', github: '29decibel/readit'

gem 'opml_saw', :git => "git://github.com/feedbin/opml_saw.git", :branch => "master"
# https://github.com/thoughtbot/paperclip/

gem 'bitly'

## Handling environment variables
gem 'figaro'

group :development do
	gem 'sqlite3'

end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bcrypt-ruby', '3.0.1'
  gem "less-rails"
  gem "therubyracer"
  gem 'simple_form'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'

end

gem 'jquery-rails'

group :production do
  gem 'pg', '0.12.2'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
