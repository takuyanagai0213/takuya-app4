class User < ApplicationRecord
  attr_accessor :remember_token
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_many :posts
  has_many :comments 
  
  has_many :bookmarks
  has_many :addbookmark, through: :bookmarks, source: :post
  has_many :reverses_of_bookmark, class_name: 'Bookmark', foreign_key: 'user_id'
  has_many :bookmarker, through: :reverses_of_bookmark, source: :user
  
  def bookmark(post)
    self.bookmarks.find_or_create_by(post_id: post.id)
  end
  
  def unbookmark(post)
    bookmark = self.bookmarks.find_by(post_id: post.id)
    bookmark.destroy if favoite
  end
  
  def bookmark_add?(post)
    self.addbookmark.include?(post)
  end
  
  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
    
    def new_token
      SecureRandom.urlsafe_base64
    end
  end
  
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def feed_posts
    @posts = Post.all
  end
end
