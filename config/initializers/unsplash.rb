Unsplash.configure do |config|
  config.application_access_key = Rails.application.credentials.dig(:unsplash, :application_access_key)
  config.application_secret = Rails.application.credentials.dig(:unsplash, :application_secret)
  config.application_redirect_uri = "https://your-application.com/oauth/callback"
  config.utm_source = "connect_plus"

  # optional:
#   config.logger = MyCustomLogger.new
end