Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['SEMINAR_PROTO_CONSUMER_ID'], ENV['SEMINAR_PROTO_CONSUMER_SECRET'], :scope => "gist"
end