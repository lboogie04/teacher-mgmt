source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.4"

gem "audited" # Use for Record Auditing
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "devise", "~> 4.9"
gem 'diffy'
gem 'image_processing', '~> 1.2'
gem "importmap-rails"
gem 'impressionist' # Page view tracker
gem "jbuilder"
gem "kramdown"
gem "paper_trail"
gem 'pg'
gem 'pdfjs_viewer-rails'
gem "puma", "~> 5.0"
gem "pundit", "~> 2.3"
gem 'rack-cors'
gem "rails", "~> 7.0.8"
gem "react_on_rails", '~> 13.4'
gem "rolify"
gem "sprockets-rails"
gem "stimulus-rails"
gem "tailwindcss-rails", "~> 2.3"
gem "turbo-rails"
gem "wicked_pdf"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem 'factory_bot_rails', '~> 6.1.0'
  gem "faker", "~> 2.22" 
  gem 'pry', '~> 0.14.2'
  gem 'rspec-rails', '~> 6.1'
  gem "wkhtmltopdf-binary"
  gem 'dotenv-rails'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem 'airborne'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'webdrivers'
end
