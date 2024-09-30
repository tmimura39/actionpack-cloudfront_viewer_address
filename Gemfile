# frozen_string_literal: true

source "https://rubygems.org"

gemspec

if ENV["RAILS_VERSION"] == "edge"
  gem "rails", github: "rails/rails", branch: "main"
elsif ENV["RAILS_VERSION"]
  gem "rails", "~> #{ENV["RAILS_VERSION"]}.0"
else
  gem "rails"
end

gem "rake"

gem "rspec", require: false
gem "rspec-rails", require: false
gem "rubocop", require: false
gem "rubocop-performance", require: false
gem "rubocop-rails", require: false
gem "rubocop-rake", require: false
gem "rubocop-rspec", require: false
gem "rubocop-rspec_rails", require: false
