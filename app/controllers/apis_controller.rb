class ApisController < ApplicationController
  require 'pry'


  def index
     @movie_rows  = Api.all
    movie_id = params[:movie_id]
    response = HTTParty.get("https://movies-api14.p.rapidapi.com/search?query=#{movie_id}", headers: {
      'X-RapidAPI-Host' => 'movies-api14.p.rapidapi.com',
      'X-RapidAPI-Key' => '562c0c79a0msha9b8db4de63e59dp131a2djsna425bbbdbb01'
    })
    @movie_detail = JSON.parse(response.body)['contents']
    render 'index.html.erb'

  end

  def show
  end

  # def create
  #   movie_id = params[:id]
  #   @movie = Api.new(
  #     title: @movie_detail['title'],
  #     rating: @movie_detail['vote_average'],
  #     genres: @movie_detail['genres'].join(', '),
  #     poster_path: @movie_detail['poster_path'],
  #     release_date: @movie_detail['release_date']
  #   )
  #
  #   if @movie.save
  #     flash[:success] = 'Movie added to database successfully!'
  #   else
  #     flash[:error] = 'Failed to add movie to database.'
  #   end
  #
  #   redirect_to root_path
  # end


  # def add_movie
  #
  #   movie_id = params[:movie_id]
  #   response = HTTParty.get("https://movies-api14.p.rapidapi.com/details/#{movie_id}", headers: {
  #     'X-RapidAPI-Host' => 'movies-api14.p.rapidapi.com',
  #     'X-RapidAPI-Key' => '562c0c79a0msha9b8db4de63e59dp131a2djsna425bbbdbb01'
  #   })
  #
  #     movie_details = JSON.parse(response.body)['contents']
  #   binding.pry
  #     title = movie_details['title']
  #     rating = movie_details['vote_average']
  #     genres = movie_details['genres']
  #     poster_path = movie_details['poster_path']
  #     release_date = movie_details['release_date']
  #     Api.create(title: title, rating: rating, genres: genres, poster_path: poster_path, release_date: release_date)
  #
  #   redirect_to root_path, notice: 'Movie added to the database'
  #   end


  # def create
  #   movie_params = {
  #     title: params[:api][:title],
  #     rating: params[:api][:rating],
  #     genres: params[:api][:genres],
  #     release_date: params[:api][:release_date],
  #     poster_path: params[:api][:poster_path]
  #   }
  #   movie = Api.new(movie_params)
  #   if movie.save
  #     flash[:success] = 'Movie added to the database!'
  #   else
  #     flash[:error] = 'Failed to add movie to the database.'
  #   end
  #   redirect_to root_path
  # end

  private

  def movie_params
    params.require(:api).permit(:title, :rating, :genres, :poster_path, :release_date)
  end
end
