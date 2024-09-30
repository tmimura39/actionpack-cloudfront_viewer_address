# ActionPack::CloudfrontViewerAddress

Calculate the remote IP ( `request.remote_ip` ) using `CloudFront-Viewer-Address`.

> [!CAUTION]
> Be sure to configure security groups and other settings so that HTTP requests go through Amazon CloudFront.  
> Otherwise, the `CloudFront-Viewer-Address` will be freely modified and IP spoofing.

## Why do you need this Gem?

If you use 'Amazon CloudFront' as the Proxy for Rails App, the remote IP ( `request.remote_ip` ) will be set to the CloudFront IP.  
To work around this problem, it was necessary to calculate the remote IP address using a combination of `X-Forwarded-For` and the 'IP address of a trusted Proxy'.
Like these Gem...

* https://github.com/dinks/cloudfront-rails
* https://github.com/customink/actionpack-cloudfront

However, CloudFront provides a more concise solution to this problem with `CloudFront-Viewer-Address`.  
This Gem is intended to make this functionality more concise for use in Rails applications.

## Usage

### Step1. Amazon CloudFront Setup

Before using this Gem, modify your Amazon CloudFront configuration to enable `CloudFront-Viewer-Address`.  
Please refer to the following for details on how to set up.

* https://aws.amazon.com/about-aws/whats-new/2021/10/amazon-cloudfront-client-ip-address-connection-port-header/
* https://dev.classmethod.jp/articles/amazon-cloudfront-client-ip-address-connection-port-header/ (written in Japanese)

### Step2. This `ActionPack::CloudfrontViewerAddress` Gem Install

Install the gem and add to the application's Gemfile by executing:

    $ bundle add actionpack-cloudfront_viewer_address

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install actionpack-cloudfront_viewer_address

### Step3. Rack middleware

**If you are using Rails, omit this as it will be set automatically.**  
Otherwise, set the middleware as `middleware.insert_after ActionDispatch::RemoteIp, ActionPack::CloudfrontViewerAddress::RemoteIp`.

### Step4. Use `request.remote_ip`

Otherwise, no special processing is required.  
The client's IP address can be obtained by referring to `request.remote_ip` as usual.

## About IP spoofing

This Gem only references the `CloudFront-Viewer-Address` request header.  
The `CloudFront-Viewer-Address` header is not improved if the request is made to a Rails application via Amazon CloudFront.  
However, if the request is made to a Rails application without going through Amazon CloudFront, the `CloudFront-Viewer-Address` can be freely rewritten and there is a risk of IP spoofing.

**Please keep this in mind.**

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tmimura39/actionpack-cloudfront_viewer_address.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
