source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis for in-memory database
gem 'redis', '~> 4.2'
gem 'redis-rails', '~> 5.0'
gem 'redis-namespace', '~> 1.8'
# Use ridgepole for schema management
gem 'ridgepole', '~> 0.9'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
# Support for Cross-Origin Resource Sharing (CORS) for Rack compatible web applications
gem 'rack-cors', '~> 1.1'

# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Use slim as template language
gem 'slim-rails', '~> 3.2'
# Pagination
gem 'pagy', '~> 3.11'
gem 'api-pagination', '~> 4.8'

# Use Pry as rails console
gem 'pry-rails', '~> 0.3'
# Manage multi-environment settings
gem 'config', '~> 3.0'
# Make managing seeds better
gem 'seed-fu', '~> 2.3'
# Use rails-i18n as a set of common locale data
gem 'rails-i18n', '~> 6.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-byebug', '~> 3.9'
  # Ruby code style checking
  gem 'rubocop', '~> 1.10'
  # A RuboCop extension focused on enforcing Rails best practices and coding conventions
  gem 'rubocop-rails', '~> 2.9'
  # RuboCop extension for RSpec
  gem 'rubocop-rspec', '~> 2.2'
  # Testing framework
  gem 'rspec-rails', '~> 4.0'
  # Speed up RSpec using Spring
  gem 'spring-commands-rspec', '~> 1.0'
  # Simplify request test code
  gem 'rspec-request_describer', '~> 0.3'
  # Simplify test code
  gem 'shoulda-matchers', '~> 4.1'
  # Run RSpec parallel
  gem 'parallel_tests', '~> 3.6'
  # Strategies for cleaning databases
  gem 'database_cleaner', '~> 2.0'
  # Code coverage
  gem 'simplecov', '~> 0.21', require: false
  # Detect N + 1 queries
  gem 'bullet', '~> 6.1'
  # Filesystem event
  gem 'listen', '~> 3.1'
  # stubbing HTTP requests and setting expectations on HTTP requests
  gem 'webmock', '~> 3.12'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.1'
  gem 'spring-watcher-listen', '~> 2.0'
  # Run db:reset without stopping app
  gem 'pgreset', '~> 0.3'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
