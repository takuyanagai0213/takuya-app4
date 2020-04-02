class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :title, presence: true, length: { maximum: 30 },
                    uniqueness: { scope: :title,
                    message: "タイトルが同じである投稿はできません。" }
  validates :detail, presence: true, length: { maximum: 300 }
  validates :picture, presence: true
  validate :picture_size
  has_many :picture_details, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmark, dependent: :destroy
  geocoded_by :address, latitude: :latitude, longitude: :longitude
  after_validation :geocode, if: :address_changed?

  private
  
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "ファイルサイズを5MB以下にしてください。")
    end
  end
end
