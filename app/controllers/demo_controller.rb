
class DemoController < ApplicationController

  def index
  response = HTTParty.get('https://imdb-top-100-movies.p.rapidapi.com/', headers: {
    'X-RapidAPI-Host' => 'imdb-top-100-movies.p.rapidapi.com',
    'X-RapidAPI-Key' => 'f6ff2a97ddmsh3bfc487a7c31997p1cbcddjsne36ba0d71576'
  })
  @movies = JSON.parse(response.body)
end
  end



# require 'rest-client'
# require 'json'
# response = RestClient.get('https://imdb-top-100-movies.p.rapidapi.com/', {accept: :json})
# JSON.parse(response.body)

#
# class
#   def methood
#     url = 'https://api.example.com/data'
#     response = RestClient.get(url)
#     data = JSON.parse(response.body)
#
#     render json: data
#   end
# end


require 'rest-client'

url = 'https://imdb-top-100-movies.p.rapidapi.com/'

headers = {
  'X-RapidAPI-Host' => 'imdb-top-100-movies.p.rapidapi.com',
  'X-RapidAPI-Key' => 'YOUR_RAPIDAPI_KEY',
  'Accept' => 'application/json'
}

  response = RestClient.get(url, headers: headers)
  puts "Response Code: #{response.code}"
  puts "Response Body: #{response.body}"





#
# url = 'https://imdb-top-100-movies.p.rapidapi.com/'
# response = RestClient.get('https://imdb-top-100-movies.p.rapidapi.com/')
#
# puts "Response Code: #{response.code}"
# puts "Response Body: #{response.body}"




# url = URI.parse('https://api.example.com/endpoint')
# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true if url.scheme == 'https'
#
# request = Net::HTTP::Get.new(url.request_uri)
#
#
# response = http.request(request)







# binding.pry
# url = 'https://imdb-top-100-movies.p.rapidapi.com/'
#
# headers = {
#   'X-RapidAPI-Host' => 'imdb-top-100-movies.p.rapidapi.com',
#   'X-RapidAPI-Key' => 'f6ff2a97ddmsh3bfc487a7c31997p1cbcddjsne36ba0d71576',
#   'Accept' => 'application/json'
# }
#
# response = RestClient.get(url, headers: headers)
# puts "Response Code: #{response.code}"
# puts "Response Body: #{response.body}"
#
# binding.pry


# binding.pry
# require "uri"
# require "net/http"
#
# #url = URI("https://imdb-top-100-movies.p.rapidapi.com/series/top1")
# url = URI("https://imdb-top-100-movies.p.rapidapi.com/")
# https = Net::HTTP.new(url.host, url.port)
# https.use_ssl = true
#
# request = Net::HTTP::Get.new(url)
# request["X-RapidAPI-Key"] = "f6ff2a97ddmsh3bfc487a7c31997p1cbcddjsne36ba0d71576"
#
# response = https.request(request)
# puts response.read_body
#
# @movie_rows = response
#
# binding.pry
#
#
#
  def index
    response = HTTParty.get('https://imdb-top-100-movies.p.rapidapi.com/', headers: {
      'X-RapidAPI-Host' => 'imdb-top-100-movies.p.rapidapi.com',
      'X-RapidAPI-Key' => 'f6ff2a97ddmsh3bfc487a7c31997p1cbcddjsne36ba0d71576'
    })
    @movies = JSON.parse(response.body)