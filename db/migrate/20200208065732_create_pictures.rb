class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.references :post, foreign_key: true
      t.string :image
      t.string :string

      t.timestamps
    end
  end
end
