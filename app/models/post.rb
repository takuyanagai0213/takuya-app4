class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :content, presence: true, length: { maximum: 30 }
  validates :detail, presence: true, length: { maximum: 300 }
  validate :picture_size
  has_many :picture_details, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmark, dependent: :destroy
  
  private
  
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "ファイルサイズを5MB以下にしてください。")
    end
  end
end
