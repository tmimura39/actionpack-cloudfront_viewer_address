# frozen_string_literal: true

RSpec.describe ActionPack::CloudfrontViewerAddress::RemoteIp do
  context "when CloudFront-Viewer-Address(IPv4 Address + Port) specified" do
    it "action_dispatch.remote_ip = IPv4 Address" do
      remote_ip = nil
      described_class
        .new(->(env) { remote_ip = env["action_dispatch.remote_ip"] })
        .call({ "action_dispatch.remote_ip" => "0.0.0.0", "HTTP_CLOUDFRONT_VIEWER_ADDRESS" => "1.1.1.1:3000" })
      expect(remote_ip).to eq "1.1.1.1"
    end
  end

  context "when CloudFront-Viewer-Address(IPv6 Address + Port) specified" do
    it "action_dispatch.remote_ip = IPv6 Address" do
      remote_ip = nil
      described_class
        .new(->(env) { remote_ip = env["action_dispatch.remote_ip"] })
        .call({ "action_dispatch.remote_ip" => "0.0.0.0", "HTTP_CLOUDFRONT_VIEWER_ADDRESS" => "1111:1111:1111:1111:1111:1111:1111:1111:3000" })
      expect(remote_ip).to eq "1111:1111:1111:1111:1111:1111:1111:1111"
    end
  end

  context "when CloudFront-Viewer-Address unspecified" do
    it "action_dispatch.remote_ip is unchanged" do
      remote_ip = nil
      described_class
        .new(->(env) { remote_ip = env["action_dispatch.remote_ip"] })
        .call({ "action_dispatch.remote_ip" => "0.0.0.0" })
      expect(remote_ip).to eq "0.0.0.0"
    end
  end
end
