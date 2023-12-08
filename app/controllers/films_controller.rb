class FilmsController < ApplicationController

  def index
    # @movie_rows = YAML.load_file(Rails.root.join('config', 'movies.yml'))
    @films = Film.all
  end

  def new
     @movie=Film.new
      @image_attachment = @movie.image.attachments.build
     #   @movie.images.build
  end

  def create
    @movie = Film.new(movie_params)

    if @movie.save
      flash[:notice]="Movie created successfully"
      redirect_to @movie
    else
      render :new
    end
  end

  def show
     @movie=Film.find(params[:id])
     # @image_attachments = @movie.images_attributes.all
     @image_attachments = @movie.image_attachments.all
  end

  def edit
    @movie=Film.find(params[:id])
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


  private

  def movie_params
    params.require(:film).permit(:title, :year, :genre, :rating, :movie, images_attachments_attributes: [:picture] )
  end

end
