class AddColumnPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :weather, :string
    add_column :posts, :temperature, :string
    add_column :posts, :time_zone, :string
    add_column :posts, :how_to_fish, :string
    add_column :posts, :fish_caught, :string
  end
end
