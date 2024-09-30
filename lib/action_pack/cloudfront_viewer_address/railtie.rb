# frozen_string_literal: true

require_relative "remote_ip"

module ActionPack
  module CloudfrontViewerAddress
    class Railtie < ::Rails::Railtie
      initializer "actionpack_cloudfront_viewer_address.configure_rails_initialization" do |app|
        app.config.middleware.insert_after ActionDispatch::RemoteIp, ActionPack::CloudfrontViewerAddress::RemoteIp
      end
    end
  end
end
