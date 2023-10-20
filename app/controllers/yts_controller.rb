class YtsController < ApplicationController
  def index
    @movie_rows = YAML.load_file(Rails.root.join('config', 'movies.yml'))
  end
end




