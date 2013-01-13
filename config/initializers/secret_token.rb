# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
SeminarProto::Application.config.secret_token = ENV['SEMINAR_PROTO_SECRET_TOKEN'] || '379e9e32731a06efe8f832ab91af83407f3917e6a58ab7ce9b3e114748b58db370910ca962a3eee4b0f2ca72b22eabf8d7471b4a7525257e4a84d84ecfd462fa'
