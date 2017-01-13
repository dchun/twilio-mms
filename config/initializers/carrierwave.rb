CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = 'twilio-mms'
  config.aws_acl    = 'public-read'

  # Optionally define an asset host for configurations that are fronted by a
  # content host, such as CloudFront.
  # config.asset_host = 'http://example.com'

  # The maximum period for authenticated_urls is only 14 days.
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 14

  # Set custom options such as cache control to leverage browser caching
  config.aws_attributes = {
    expires: 2.week.from_now.httpdate,
    cache_control: "max-age=#{14.day.to_i}"
  }

  config.aws_credentials = {
    access_key_id:     ENV['aws_access_key_id'],
    secret_access_key: ENV['aws_secret_access_key'],
    region:            'us-west-1' # Required
  }

  # Optional: Signing of download urls, e.g. for serving private content through
  # CloudFront. Be sure you have the `cloudfront-signer` gem installed and
  # configured:
  # config.aws_signer = -> (unsigned_url, options) do
  #   Aws::CF::Signer.sign_url(unsigned_url, options)
  # end
end