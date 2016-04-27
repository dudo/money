source 'https://rubygems.org'

ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.beta1', '< 5.1'
# gem 'sinatra', require: nil, github: 'sinatra/sinatra'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Use Puma as the app server
gem 'puma'
gem 'bcrypt' # Use ActiveModel has_secure_password
gem 'devise', github: 'plataformatec/devise'
gem 'plaid' # Integration with plaid.com's API

gem 'slim'
gem 'sass-rails' # Use SCSS for stylesheets
gem 'bourbon'
gem 'neat'
gem 'bitters'
gem 'autoprefixer-rails'

gem 'meta-tags'
gem 'rails_config'
gem 'annotate'
gem 'sidekiq'
gem 'awesome_print'
gem 'react-rails', '~> 1.5.0'
gem 'active_model_serializers', '0.10.0.rc5', github: 'rails-api/active_model_serializers'
gem 'best_in_place', '~> 3.1.0'
gem 'ranked-model'
gem 'mandrill-api'
gem 'descriptive_statistics', require: 'descriptive_statistics/safe'

# bower
source 'https://rails-assets.org' do
  gem 'rails-assets-dragula'
  gem 'rails-assets-humps'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'letter_opener'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  gem 'rails_stdout_logging'
  gem 'rails_12factor'
end