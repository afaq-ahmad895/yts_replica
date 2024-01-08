class AddFilmIdToImages < ActiveRecord::Migration[5.2]
  def change
       add_column :images, :film_id, :integer
  end
end
