class YtsController < ApplicationController

def index
  @movie_rows = YAML.load_file(Rails.root.join('config', 'movies.yml'))

  respond_to do |format|
    format.html
    format.json do
      json_data = {}
      @movie_rows.each_with_index do |row, index|
        row_key = "row_#{index + 1}"
        json_data[row_key] = row.map do |movie|
          {
            name: movie['name'],
            rating: movie['rating'],
            year: movie['year'],
            drama: movie['drama'],
            action: movie['action'],
            image: movie['image']
          }
        end
      end
      render json: json_data
    end
  end
end
end







