# frozen_string_literal: true

require_relative "boot"

require "rails"
require "action_controller/railtie"

require "actionpack/cloudfront_viewer_address"

module Dummy
  class Application < Rails::Application
    config.eager_load = true
  end
end
