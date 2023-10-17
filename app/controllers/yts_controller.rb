class YtsController < ApplicationController
  def index
    @movie_rows = YAML.load_file(Rails.root.join('config', 'movies.yml'))


    @movie_rows.to_json do |movie|
      
      binding.pry


      # {
      #   name: movie['name'],
      #   year: movie['year'],
      #   rating: movie['rating']
      # }
    end

    respond_to do |format|
      format.html
      format.json { render json: @movie_rows }
    end
  end

end