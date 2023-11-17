class YtsController < ApplicationController
  def index
    @movie_rows = YAML.load_file(Rails.root.join('config', 'movies.yml'))

    respond_to do |format|
      format.html
      format.json do
         render json: @movie_rows
      end
    end
  end


  def movie_100_top
    # - API Call to the 3rd party
    # - JSON ifnormationn nikal k ek variable main rakhni hai
    # -

    @movies_100_top
  end

  def movies_list
    @movie_list = YAML.load_file(Rails.root.join('config', 'movies.yml'))

    render json: @movie_list
    # respond_to do |format|
    #   format.html
    #   format.json do
      # end
    # end
  end

  def movie_api
    # binding.pry
    data_of_yml = YAML.load_file(Rails.root.join('config', 'movies.yml'))

    json_data = {}
    data_of_yml.each_with_index do |row, index|
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

    @movie_rows = json_data

    respond_to do |format|
      format.html
      format.json do
        # render json: json_data
        render json: @movie_rows
      end
    end
  end
end