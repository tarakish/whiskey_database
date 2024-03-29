source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# For FileUploader
gem 'carrierwave', '~> 2.0'
gem 'fog-aws'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# For Inserting initial data
gem 'seed-fu'

# For Authentication
gem 'pundit'
gem 'sorcery'

# For UI
gem 'semantic-ui-sass'

# Use Pagenation
gem 'pagy', '~> 5.10'

# For Search Function
gem 'ransack'
gem 'ransack-enum', '~> 1.0'

# For Control Constant
gem 'config'

# For i18n
gem 'enum_help'
gem 'rails-i18n', '~> 6.0'

# For SEO
gem 'meta-tags'
gem 'sitemap_generator'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # RSpec and related
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 5.0.0'
  # Use ruby support
  gem 'solargraph', require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Debug Utility
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  # Lint check
  gem 'rails_best_practices'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  # Generate model schema
  gem 'annotate'
end

group :test do
  gem 'capybara'
  # Caliculate code_coverage
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
