require 'slack-ruby-client'

require 'certified'
require 'dotenv/load'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  fail 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

client = Slack::Web::Client.new

client.auth_test

client.chat_postMessage(channel: '#tech', text: 'Hello World', as_user: true)
