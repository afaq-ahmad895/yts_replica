class AddPictureToApis < ActiveRecord::Migration[5.2]
  def change
    add_column :apis, :picture, :string
  end
end
