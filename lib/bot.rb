require 'telegram/bot'
require_relative '../config'
require_relative '../lib/jokes'
require_relative '../lib/random'
require_relative '../lib/facts'
# rubocop:disable Layout/LineLength
class Bot
  def initialize
    Telegram::Bot::Client.run(TELEGRAM_TOKEN_ID) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Hello, #{message.from.first_name}. My name is Jokes. I tell Awesome Chuck Nories Jokes And also give fact Trivia questions to answer about years in the past . To more about what i can do run '/help' ")
        when '/jokes'
          new_jokes = Jokes.new
          jokes = new_jokes.jokes

          bot.api.send_message(chat_id: message.chat.id, text: " #{jokes}".to_s, date: message.date)
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
        when '/trivia'
          random = Facts.new
          facts = random.facts
          bot.api.send_message(chat_id: message.chat.id, text: "What year, #{facts}?")
        when '/about'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Hey!, My name is Ralph Oburu creator of @notJokesBot. I was born and rasied in Kenya but now reside in Uganda. I love to play video games and if you want to challange me in any game just look me up on xbox live @springyboard and get ready to lose. I created this bot as part of a microverse capston project to show case my skills as a developer of the Ruby language. To get more help use the command '/help' to see more.")
        when '/help'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Don't know what to do!! 😭 😭 . Just type the command '/jokes' to see awesome jokes of Chuck Norris, '/trivia' to get a random trivia question based on facts of past years, '/about' to see more about my creator and '/stop' to stop me 🙁.")
        end
      end
    end
  end
end
# rubocop:enable Layout/LineLength
