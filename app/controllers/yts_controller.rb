require 'pry'
class YtsController < ApplicationController

  def index2
     @movie_rows = YAML.load_file(Rails.root.join('config', 'movies.yml'))
    end

#     respond_to do |format|
#       format.html
#       format.json do
#          render json: @movie_rows
#       end
#     end
#   end
#
#
#   def movie_100_top
#     # - API Call to the 3rd party
#     # - JSON ifnormationn nikal k ek variable main rakhni hai
#     # -
#
#     @movies_100_top
#   end
#
#   def movies_list
#     @movie_list = YAML.load_file(Rails.root.join('config', 'movies.yml'))
#
#     render json: @movie_list
#     # respond_to do |format|
#     #   format.html
#     #   format.json do
#       # end
#     # end
#   end
#
#   def movie_api
#     # binding.pry
#     data_of_yml = YAML.load_file(Rails.root.join('config', 'movies.yml'))
#
#     json_data = {}
#     data_of_yml.each_with_index do |row, index|
#       row_key = "row_#{index + 1}"
#
#       json_data[row_key] = []
#       row.each do |movie|
#         json_data[row_key] << {
#           name: movie['name'],
#           rating: movie['rating'],
#           year: movie['year']
#         }
#       end
#     end
#
#     @movie_rows = json_data
#
#     respond_to do |format|
#       format.html
#       format.json do
#         # render json: json_data
#         render json: @movie_rows
#       end
#     end
#   end
# end
# include HTTParty
# require 'httparty'
  
  def index1
  response = HTTParty.get('https://imdb-top-100-movies.p.rapidapi.com/', headers: {
    'X-RapidAPI-Host' => 'imdb-top-100-movies.p.rapidapi.com',
    'X-RapidAPI-Key' => '7a15c90dfbmsh27f1e2e871c0f21p1c7c11jsn784ee34a2303'
  })
  @movies_row = JSON.parse(response.body)
end


  def index3
    response = HTTParty.get('https://movies-api14.p.rapidapi.com/movies', headers: {
      'X-RapidAPI-Host' => 'movies-api14.p.rapidapi.com',
      'X-RapidAPI-Key' => '7a15c90dfbmsh27f1e2e871c0f21p1c7c11jsn784ee34a2303'
    })
    @movies_row1 = JSON.parse(response.body)['movies']
  end




  def search
    response = HTTParty.get('https://movies-api14.p.rapidapi.com/search?query=breaking%20bad', headers: {
      'X-RapidAPI-Host' => 'movies-api14.p.rapidapi.com',
      'X-RapidAPI-Key' => '7a15c90dfbmsh27f1e2e871c0f21p1c7c11jsn784ee34a2303'
    })
    @movie_detail = JSON.parse(response.body)['contents']

  end



  def search1
    movie_id = params[:movie_id]
    response = HTTParty.get("https://movies-api14.p.rapidapi.com/search?query=#{@movie_id}", headers: {
      'X-RapidAPI-Host' => 'movies-api14.p.rapidapi.com',
      'X-RapidAPI-Key' => '7a15c90dfbmsh27f1e2e871c0f21p1c7c11jsn784ee34a2303'
    })

    @movie_detail = JSON.parse(response.body)['contents']
    render 'search.html.erb'
  end



end
