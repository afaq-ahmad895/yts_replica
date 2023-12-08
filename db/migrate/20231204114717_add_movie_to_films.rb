class AddMovieToFilms < ActiveRecord::Migration[5.2]
  def change
    add_column :films, :movie, :string
  end
end


