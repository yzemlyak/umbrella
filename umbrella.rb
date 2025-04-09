# Write your solution below!
require "http"
require "dotenv/load"
pp "=========================================="
pp "Will you need an umbrella today?"
pp "=========================================="
pp "Where are you today?"
# user_location = gets.chomp
user_location = "Gleacher Center, Chicago"
pp user_location
env_fetch = ENV.fetch("GMAPS_KEY")
google_api_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{env_fetch}"
resp = HTTP.get(google_api_url)
raw_body = resp.to_s
parsed_body = JSON.parse(raw_body)
lat = parsed_body.fetch("results").at(0).fetch("geometry").fetch("location").fetch("lat")
lng = parsed_body.fetch("results").at(0).fetch("geometry").fetch("location").fetch("lng")
pp lat
pp lng
