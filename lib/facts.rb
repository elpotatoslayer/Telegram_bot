require 'json'
require 'uri'
require 'net/http'
require 'openssl'

# Facts api
class Facts
  def facts
    url = URI('https://numbersapi.p.rapidapi.com/1492/year?fragment=true&json=true')

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request['x-rapidapi-host'] = 'numbersapi.p.rapidapi.com'
    request['x-rapidapi-key'] = 'a5873a207fmsh00deec8ce154ba7p14363ajsnf8f46edd635f'

    response = http.request(request)
    response.read_body
    JSON.parse(response.read_body)['text']
  end
end

# Jokes Api
class Jokes
  def jokes
    url = URI('https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random')

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request['x-rapidapi-host'] = 'matchilling-chuck-norris-jokes-v1.p.rapidapi.com'
    request['x-rapidapi-key'] = 'a5873a207fmsh00deec8ce154ba7p14363ajsnf8f46edd635f'
    request['accept'] = 'application/json'

    response = http.request(request)
    response.read_body
    JSON.parse(response.read_body).values[6]
  end
end
