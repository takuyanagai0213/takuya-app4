class PictureDetail < ApplicationRecord
  belongs_to :post
  validates :image1, presence: true
  mount_uploader :image1, PictureUploader
end
