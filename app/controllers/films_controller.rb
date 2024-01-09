require 'pry'
class FilmsController < ApplicationController

  def add_movie
    # movie_id = params[:movie_id]
    # response = HTTParty.get("https://movies-api14.p.rapidapi.com/movie/#{movie_id}", headers: {
    #   'X-RapidAPI-Host' => 'movies-api14.p.rapidapi.com',
    #   'X-RapidAPI-Key' => '562c0c79a0msha9b8db4de63e59dp131a2djsna425bbbdbb01'
    # })
    # movie_detail = JSON.parse(response.body)
    # film =  Film.create(
    #   rapid_id: ['_id'],
    #   title: movie_detail['title'],
    #   year: movie_detail['release_date'],
    #   genre: movie_detail['genres'],
    #   rating: movie_detail['vote_average']
    #   )
    # if film.save
    #   film.images.create(picture: movie_detail['poster_path'])
    #   redirect_to 'index.html.erb', notice: 'Movie added to the database.'
    # else
    #   redirect_to 'index.html.erb', alert: 'Failed to add the movie to the database.'
    # end
    binding.pry
        movie_id = params[:movie_id]
      movie = Film.create(
        rapid_id: params['movie_id'],
        title: params['title'],
        rating: params['rating'],
        genre: params['genre'],
        year: params['year']
      )

    if movie.save
      movie.images.create(picture: params['picture'])
      binding.pry
      redirect_to 'index.html.erb', notice: 'Movie added to the database.'
    else
      redirect_to 'index.html.erb', alert: 'Failed to add the movie to the database.'
    end
    end

  def index
    @films = Film.all
    movie_id = params[:movie_id]
    #  @films = Film.where(title: movie_id)
    response = HTTParty.get("https://movies-api14.p.rapidapi.com/search?query=#{movie_id}", headers: {
      'X-RapidAPI-Host' => 'movies-api14.p.rapidapi.com',
      'X-RapidAPI-Key' => '562c0c79a0msha9b8db4de63e59dp131a2djsna425bbbdbb01'
    })
    @movie_detail = JSON.parse(response.body)['contents']
    @new_movies = @movie_detail.reject { |movie| @films.exists?(title: movie['title']) }
    render 'index.html.erb'
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
     @movie=Film.find(params[:id])
        @image_attachments = @movie.images.all
  end

  def edit
    @movie=Film.find(params[:id])
    @image_attachments = @movie.images.all
  end

  def update
    @movie=Film.find(params[:id])
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
    @movie=Film.find(params[:id])
    @movie.destroy
    flash[:notice]="Movie deleted successfully"
    redirect_to films_path
  end

  private

  def movie_params
    params.require(:film).permit(:title, :year, :genre , :rapid_id, :rating, :movie, images_attributes: [:picture,:id,:film_id] )
  end

end
