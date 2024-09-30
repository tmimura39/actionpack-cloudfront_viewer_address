# frozen_string_literal: true

require_relative "cloudfront_viewer_address/version"
require_relative "cloudfront_viewer_address/remote_ip"

require_relative "cloudfront_viewer_address/railtie" if defined?(Rails::Railtie)

module ActionPack
  module CloudfrontViewerAddress
  end
end
