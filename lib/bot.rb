require 'telegram_bot'
require_relative '../config.rb'
require_relative 'jokes.rb'


class Bot
  def initialize
    bot = TelegramBot.new(TELEGRAM_TOKEN_ID)

    bot.get_updates do |message|
      command = message.get_command_for(bot)
      
      message.reply do |reply|
        case command
        when /greet/i
          reply.text = "Hello, #{message.from.first_name}!"
        when '/motivate'
          values = Jokes.new
          value = values.random_joke
          bot.send_message(chat_id: message.chat.id, text: "#{value['text']}", date: message.date)
        else
          reply.text = "#{message.from.first_name}, have no idea what #{command.inspect} means."
        end
        puts "sending #{reply.text.inspect} to @#{message.from.username}"
        # reply.send_with(bot)
      end
    end
  end
end

