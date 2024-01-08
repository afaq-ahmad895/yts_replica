class ApisController < ApplicationController
  require 'pry'


  def index
      movie_id = params[:movie_id]
      @movie_rows = Api.where(title: movie_id)
    response = HTTParty.get("https://movies-api14.p.rapidapi.com/search?query=#{movie_id}", headers: {
      'X-RapidAPI-Host' => 'movies-api14.p.rapidapi.com',
      'X-RapidAPI-Key' => '562c0c79a0msha9b8db4de63e59dp131a2djsna425bbbdbb01'
    })
    @movie_detail = JSON.parse(response.body)['contents']
       @new_movies = @movie_detail.reject { |movie| @movie_rows.exists?(title: movie['title']) }
      # @new_movies = []
      # @movie_detail.each do |movie|
      #   unless @movie_rows.include?(movie['title'])
      #     @new_movies << movie
      #   end
      # end
      render 'index.html.erb'
  end

  def show
  end

  private

  def movie_params
    params.require(:api).permit(:title, :rating, :genres, :picture, :release_date)
  end
end
