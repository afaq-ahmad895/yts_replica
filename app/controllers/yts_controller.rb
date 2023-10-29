class YtsController < ApplicationController
  def index
    @movie_rows = YAML.load_file(Rails.root.join('config', 'movies.yml'))

    respond_to do |format|
      format.html
      format.json { render json: @movie_rows }
    end
  end

end