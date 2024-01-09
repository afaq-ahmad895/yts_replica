class AddRapidIdToFilms < ActiveRecord::Migration[5.2]
  def change
    add_column :films, :rapid_id, :integer
  end
end
