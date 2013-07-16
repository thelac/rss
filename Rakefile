#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

# TODO: Refactor Rakefile

require File.expand_path('../config/application', __FILE__)

Rss::Application.load_tasks

task :commit do
	message = ENV['message'] || "update #{Time.now.utc}"
	sh "bundle install"
	sh "git add --ignore-removal ."
	sh "git commit -m '#{message}'"
	sh "git push -f origin master"
end

task :deploy do	
	message = ENV['message'] || "update #{Time.now.utc}"
	sh "bundle install"
	sh "git add --ignore-removal ."
	sh "git commit -m '#{message}'"
	sh "git push -f heroku master"
	sh "git push -f origin master"
	sh "rake figaro:heroku"
	# sh "heroku pg:reset DATABASE --app cryptic-reef-9153 --confirm cryptic-reef-9153"
	# sh "heroku run rake db:migrate --app cryptic-reef-9153"
	# sh "heroku open --app cryptic-reef-9153"
end