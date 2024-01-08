class RemovePosterPathFromApis < ActiveRecord::Migration[5.2]
  def change
    remove_column :apis, :poster_path, :string
  end
end
