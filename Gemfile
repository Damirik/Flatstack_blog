source "https://rubygems.org"

gem "rails", "~> 5.0.0"
gem "pg"

# assets
gem "sass-rails"
gem "uglifier"
gem "jquery-rails"
gem "foundation-rails"
gem "coffee-rails"

# views
gem "active_link_to"
gem "metamagic"
gem "slim-rails"
gem "simple_form"

# all other gems
gem "puma"
gem "decent_exposure"
gem "devise"
gem "responders"
gem "pundit"
gem "activemodel-serializers-xml"
gem "draper", git: "https://github.com/audionerd/draper", branch: "rails5"
gem "decent_decoration"
gem "kaminari"
gem "omniauth-google-oauth2"
gem "fragments.js", github: "fs/fragments.js"

group :test do
  gem "capybara"
  gem "shoulda-matchers", "~> 3.0"
  gem "email_spec"
  gem "formulaic"
  gem "rspec-its"
end

group :development, :test do
  gem "byebug"
  gem "factory_girl_rails"
  gem "rspec-rails"
  gem "faker"
  gem "rubocop", require: false
  gem "rubocop-rspec", require: false
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "scss_lint", require: false
  gem "slim_lint", require: false
end

group :development do
  gem "better_errors"
  gem "pry-rails"
  gem "web-console"
  gem "spring"
  gem "spring-commands-rspec"
  gem "foreman", require: false
end
