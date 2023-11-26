class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :title
      t.integer :year
      t.string :genre
      t.float :rating

      t.timestamps
    end
  end
end
