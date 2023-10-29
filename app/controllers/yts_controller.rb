class YtsController < ApplicationController
def index
  @movie_rows = YAML.load_file(Rails.root.join('config', 'movies.yml'))

  respond_to do |format|
    format.html
    format.json do
      json_data = @movie_rows.map do |movies|
        movies.map do |movie|
          {
            name: movie['name'],
            rating: movie['rating'],
            year: movie['year']
          }
        end
      end
      render json: json_data
    end
  end
end
end