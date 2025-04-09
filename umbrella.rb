# Write your solution below!
require "http"
require "dotenv/load"
pp "=========================================="
pp "Will you need an umbrella today?"
pp "=========================================="
pp "Where are you today?"
user_location = gets.chomp
#user_location = "Gleacher Center, Chicago"
pp user_location
env_fetch_gmaps = ENV.fetch("GMAPS_KEY")
google_api_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{env_fetch_gmaps}"
resp = HTTP.get(google_api_url)
raw_body = resp.to_s
parsed_body = JSON.parse(raw_body)
lat = parsed_body.fetch("results").at(0).fetch("geometry").fetch("location").fetch("lat")
lng = parsed_body.fetch("results").at(0).fetch("geometry").fetch("location").fetch("lng")
pp lat
pp lng
env_fetch_pirate = ENV.fetch("PIRATE_WEATHER_KEY")
pirate_api_url = "https://api.pirateweather.net/forecast/#{env_fetch_pirate}/#{lat},#{lng}"
# pp pirate_api_url
resp_pirate = HTTP.get(pirate_api_url)
raw_pirate = resp_pirate.to_s
parsed_pirate = JSON.parse(raw_pirate)
# pp parsed_pirate
odds_rain = parsed_pirate.fetch("currently").fetch("precipProbability")
# pp odds_rain
if odds_rain >= 0.25
  pp "Bring an umbrella, or you'll be wet!"
else
  pp "You're dry... for now!"
end 
