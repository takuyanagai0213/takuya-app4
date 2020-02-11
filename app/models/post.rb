class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :content, presence: true, length: { maximum: 30 }
  validates :detail, presence: true, length: { maximum: 300 }
  validate :picture_size
  belongs_to :picture_detail
  has_many :comments
  
  private
  
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "ファイルサイズを5MB以下にしてください。")
    end
  end
end
