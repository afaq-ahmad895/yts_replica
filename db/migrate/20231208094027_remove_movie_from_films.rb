class RemoveMovieFromFilms < ActiveRecord::Migration[5.2]
  def change
    remove_column :films, :movie, :string
  end
end

