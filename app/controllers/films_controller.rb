require 'pry'
require 'open-uri'
class FilmsController < ApplicationController
  before_action :set_id, only: [:show, :edit, :update, :destroy]

  def add_movie
    movie = Film.create(
      rapid_id: params['movie_id'],
      title: params['title'],
      rating: params['rating'],
      genre: params['genre'],
      year: params['year']
    )
    if movie.save
      if params['picture'].present?
        movie.images.create(remote_picture_url: params['picture'])
        redirect_to 'index.html.erb', notice: 'Movie added to the database.'
      else
        redirect_to 'index.html.erb', notice: 'Movie added to the database without a picture.'
      end
    else
      redirect_to 'index.html.erb',"Error: #{movie.errors.full_messages.join(", ")}"
    end
  end

  def index
    @films = Film.all
    # for my understanding: (@films = Film.where(title: movie_id))
    response = HTTParty.get("https://movies-api14.p.rapidapi.com/search?query=#{params[:movie_id]}", headers: {
      'X-RapidAPI-Host' => ENV['X_RAPIDAPI_HOST'],
      'X-RapidAPI-Key' => ENV['X_RAPIDAPI_KEY']
    })
    @movie_detail = JSON.parse(response.body)['contents']
    @new_movies = @movie_detail.reject { |movie| @films.exists?(title: movie['title']) }
    # @new_movies = @movie_detail - @films
  end

  def new
    @movie=Film.new
    @image_attachment = @movie.images.build
  end
  def create
    @movie = Film.new(movie_params)
    if @movie.save
      params[:images]['picture'].each do |a|
        @image_attachment = @movie.images.create!(:picture => a,   :film_id => @movie.id)
      end
      flash[:notice]="Movie created successfully"
      redirect_to @movie
    else
      render :new
    end
  end

  def show
    @image_attachments = @movie.images.all
  end

  def edit
    @image_attachments = @movie.images.all
  end

  def update
    if @movie.update(movie_params)
      params[:images]['picture'].each do |a|
        @image_attachment = @movie.images.create!(picture: a, film_id: @movie.id)
      end
      flash[:notice]="Movie updated successfully"
      redirect_to @movie
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    flash[:notice]="Movie deleted successfully"
    redirect_to films_path
  end

  private
  def movie_params
    params.require(:film).permit(:title, :year, :genre , :rapid_id, :rating, :movie, images_attributes: [:picture,:id,:film_id] )
  end
  def set_id
    @movie=Film.find(params[:id])
  end
end




