class AddDetailToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :detail, :string
  end
end
