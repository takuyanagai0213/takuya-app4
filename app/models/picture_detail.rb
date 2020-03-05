class PictureDetail < ApplicationRecord
  belongs_to :post
  mount_uploader :image1, PictureUploader
end
