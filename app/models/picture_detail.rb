class PictureDetail < ApplicationRecord
  belongs_to :post
  mount_uploader :image1, PictureUploader
  mount_uploader :image2, PictureUploader
  mount_uploader :image3, PictureUploader
end
