class Area < ApplicationRecord
    has_many :post_category_area_relations
    has_many :posts, through: :post_category_area_relations
end
