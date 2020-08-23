class Category < ApplicationRecord
    belongs_to :user, dependent: :destroy
    validates :name, presence: true, length: { maximum: 15 }
    has_many :post_category_relations, dependent: :destroy
    has_many :posts, through: :post_category_relations
end
