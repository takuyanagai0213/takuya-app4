class CreatePostCategoryAreaRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :post_category_area_relations do |t|
      t.references :post, foreign_key: true
      t.references :area, foreign_key:true
      t.timestamps
    end
  end
end
