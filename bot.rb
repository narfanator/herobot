require 'slack-ruby-bot'

require 'certified'
require 'dotenv/load'

class WeatherBot < SlackRubyBot::Bot
  help do
    title 'Weather Bot'
    desc 'This bot tells you the weather.'

    command 'clouds' do
      desc 'Tells you how many clouds there\'re above you.'
    end

    command 'What\'s the weather in <city>?' do
      desc 'Tells you the weather in a <city>.'
      long_desc "Accurate 10 Day Weather Forecasts for thousands of places around the World.\n" \
        'We provide detailed Weather Forecasts over a 10 day period updated four times a day.'
    end
  end

  command 'ping' do |client, data, _match|
    client.say(text: 'pong', channel: data.channel)
  end

  match(/weather (.+)/i) do |client, data, match|
    client.say(channel: data.channel, text: "The weather in #{match[0]} is nice.")
  end
end

SlackRubyBot::Client.logger.level = Logger::WARN
WeatherBot.run
