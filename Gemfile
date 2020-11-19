source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# core
ruby '2.6.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.4', '>= 5.2.4.4'

# API
gem 'bcrypt', '~> 3.1.7'
gem 'jwt', '~> 2.2', '>= 2.2.2'
gem 'rack-cors', '~> 1.1', '>= 1.1.1'

# cache
gem 'bootsnap', '>= 1.1.0', require: false

group :development do
  gem 'rubocop', '~> 0.93.1'
  gem 'sqlite3', '~> 1.3', '>= 1.3.11'

  # traceback
  gem 'better_errors', '~> 2.1', '>= 2.1.1'
  gem 'binding_of_caller', '~> 0.8.0'
end

group :test do
  # unit
  gem 'rspec-rails', '~> 3.4', '>= 3.4.2'

  # integration
  # gem 'capybara', '~> 3.33'
  # gem 'database_cleaner', '~> 1.8', '>= 1.8.5'
  # gem 'webdrivers', '~> 4.4', '>= 4.4.1'
end

# Windows
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
