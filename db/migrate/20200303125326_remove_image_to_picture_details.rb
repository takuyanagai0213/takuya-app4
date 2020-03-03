class RemoveImageToPictureDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :picture_details, :image2, :string
    remove_column :picture_details, :image3, :string
  end
end
