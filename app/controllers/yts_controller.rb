#require 'rest-client'
class YtsController < ApplicationController
  def index
    @movie_rows = YAML.load_file(Rails.root.join('config', 'movies.yml'))

    json_data = {}
    @movie_rows.each_with_index do |row, index|
      row_key = "row_#{index + 1}"

      json_data[row_key] = []
      row.each do |movie|
        json_data[row_key] << {
          name: movie['name'],
          rating: movie['rating'],
          year: movie['year']
        }
      end
    end

    respond_to do |format|
      format.html
      format.json do
        render json: json_data
      end
    end
  end


end







