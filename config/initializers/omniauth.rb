Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET']
  provider :pocket, ENV['POCKET_CONSUMER_KEY']
  provider :readability, ENV['READABILITY_KEY'], ENV['READABILITY_READER_KEY']
end