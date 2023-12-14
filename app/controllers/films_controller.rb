require 'pry'
class FilmsController < ApplicationController

  def index
    # @movie_rows = YAML.load_file(Rails.root.join('config', 'movies.yml'))
     @films = Film.all
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



  def delete_image
    @image_attachment = Image.find(params[:id])
    @image_attachment.destroy
    redirect_to root_path, notice: 'Image deleted successfully.'
  end



  private

  def movie_params
    params.require(:film).permit(:title, :year, :genre, :rating, :movie, images_attributes: [:picture,:id,:film_id] )
  end

end
