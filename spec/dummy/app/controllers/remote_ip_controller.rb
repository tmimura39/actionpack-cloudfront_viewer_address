# frozen_string_literal: true

class RemoteIpController < ActionController::API
  def show
    render plain: request.remote_ip
  end
end
