class YtsController < ApplicationController
  def index
    # @movie_rows = YAML.load_file(Rails.root.join('config', 'movies.yml'))
    @movie = Film.all
  end

  def new

    # @movie=Film.new
  end


  def create
    @movie = Film.new(movie_params)

    if @movie.save
      redirect_to @movie, notice: 'Movie was successfully created.'
    else
      render :new
    end
  end

  private

  def movie_params
    params.require(:film).permit(:title, :year, :genre, :rating)
  end


end


