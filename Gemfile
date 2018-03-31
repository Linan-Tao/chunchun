# source 'https://rubygems.org'
source 'https://gems.ruby-china.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.3'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'acts-as-taggable-on', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'ckeditor'
gem 'closure_tree', '~> 6.6'
gem 'devise', '~> 4.3'
gem 'faraday', '~> 0.13.1'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'filesize'
gem 'font-awesome-rails', '~> 4.7.0'
gem 'grape', '~> 0.19.1'
gem 'grape-entity', '~> 0.6.1'
gem 'grape-route-helpers', '~> 2.0'
gem 'grape-swagger'
gem 'grape-swagger-entity', '~> 0.2.0'
gem 'grape-swagger-rails' # , group: [:development]
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jwt', '~> 2.1'
gem 'kaminari', '~> 1.0', '>= 1.0.1'
gem 'kaminari-bootstrap', '~> 3.0', '>= 3.0.1'
gem 'kaminari-i18n', '~> 0.4.0'
gem 'paperclip', '~> 5.1'
gem 'qiniu'
gem 'rack-cors', '~> 0.4.1'
gem 'rails-i18n', '~> 5.0.0'
gem 'rails-i18n-generator'
gem 'select2-rails'
gem 'simple_form', '~> 3.5'

group :development, :test do
  gem 'annotate'
  gem 'overcommit'
  gem 'rubocop'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'pry-rails'
  gem 'seed_dump'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'capistrano', '~> 3.10'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
