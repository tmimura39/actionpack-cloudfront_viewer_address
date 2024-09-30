# frozen_string_literal: true

RSpec.describe "Rails Integration", type: :request do
  it "Rack Middleware auto inserted" do
    get "/remote_ip", headers: { "CloudFront-Viewer-Address" => "1.1.1.1:3000" }
    expect(response.body).to eq "1.1.1.1"

    middlewares = app.middleware.to_a
    expect(middlewares.index(ActionDispatch::RemoteIp) - middlewares.index(ActionPack::CloudfrontViewerAddress::RemoteIp)).to eq(-1)
  end
end
