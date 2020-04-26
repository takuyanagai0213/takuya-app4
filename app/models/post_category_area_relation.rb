class PostCategoryAreaRelation < ApplicationRecord
    belongs_to :post
    belongs_to :area
end
