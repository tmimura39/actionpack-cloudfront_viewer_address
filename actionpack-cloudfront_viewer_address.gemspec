# frozen_string_literal: true

require_relative "lib/action_pack/cloudfront_viewer_address/version"

Gem::Specification.new do |spec|
  spec.name = "actionpack-cloudfront_viewer_address"
  spec.version = ActionPack::CloudfrontViewerAddress::VERSION
  spec.authors = ["Tomohiko Mimura"]
  spec.email = ["mito.5525@gmail.com"]

  spec.summary = "Calculate RemoteIp based on `CloudFront-Viewer-Address` Header"
  spec.description = "Utilize `CloudFront-Viewer-Address`, a custom CloudFront header, to calculate RemoteIp more simply"
  spec.homepage = "https://github.com/tmimura39/actionpack-cloudfront_viewer_address"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/tree/main/CHANGELOG.md"

  spec.metadata["rubygems_mfa_required"] = "true"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "actionpack"
end
