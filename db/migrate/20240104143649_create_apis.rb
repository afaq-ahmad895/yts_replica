class CreateApis < ActiveRecord::Migration[5.2]
  def change
    create_table :apis do |t|
      t.string :title
      t.float :rating
      t.string :genres
      t.string :poster_path
      t.date :release_date

      t.timestamps
    end
  end
end
