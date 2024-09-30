# frozen_string_literal: true

require "action_dispatch"

module ActionPack
  module CloudfrontViewerAddress
    class RemoteIp
      def initialize(app)
        @app = app
      end

      def call(env)
        req = ::ActionDispatch::Request.new(env)
        if env["HTTP_CLOUDFRONT_VIEWER_ADDRESS"].present?
          # IPv4 "HTTP_CLOUDFRONT_VIEWER_ADDRESS" = "1.1.1.1:3000"
          # IPV6 "HTTP_CLOUDFRONT_VIEWER_ADDRESS" = "0000:0000:0000:0000:0000:0000:0000:0000:3000"
          req.remote_ip = req.env["HTTP_CLOUDFRONT_VIEWER_ADDRESS"].sub(/:\d+\z/, "") # remove `port(:0000)` part
        end
        app.call(req.env)
      end

      private

      attr_reader :app
    end
  end
end
