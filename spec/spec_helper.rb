# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../spec/dummy/config/environment.rb", __dir__)
ENV["RAILS_ROOT"] ||= "#{File.dirname(__FILE__)}/../../../spec/dummy"
require "rspec/rails"

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"

  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.filter_run_when_matching :focus
  config.warnings = true
  config.order = :random
  Kernel.srand config.seed
end
