class ApisController < ApplicationController
  require 'pry'


  def index
    response = HTTParty.get('https://movies-api14.p.rapidapi.com/movies', headers: {
      'X-RapidAPI-Host' => 'movies-api14.p.rapidapi.com',
      'X-RapidAPI-Key' => '562c0c79a0msha9b8db4de63e59dp131a2djsna425bbbdbb01'
    })
    movies_data = JSON.parse(response.body)['movies']
    # movies_data.each do |movie_data|
    #   Api.create(movie_data)
    # end
    binding.pry
    movies_data.each do |movie|
      a = Api.create(
        title: movie['title'],
        release_date: movie['release_date'],
        genres: movie['genres'],
        rating: movie['rating'],
        poster_path: movie['poster_path'],
      )
    end
  end

  private

  def movie_params
    params.require(:api).permit(:title, :rating, :genres, :poster_path, :release_date)
  end
end
