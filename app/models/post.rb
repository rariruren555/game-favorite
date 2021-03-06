class Post < ApplicationRecord
  validates :game_name, presence: true
  validates :game_hard, presence: true
  validates :text, presence: true

  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  def self.search(search)
    if search
      Post.where('game_name LIKE(?) OR game_hard LIKE(?)', "%#{search}%", "%#{search}%")
    else
      Post.all
    end
  end

  mount_uploader :image, ImageUploader
end
