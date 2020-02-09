class CreatePictureDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :picture_details do |t|
      t.string :image1
      t.string :image2
      t.string :image3
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
