class Post < ApplicationRecord
  validates :game_name, presence: true
  validates :game_hard, presence: true
  validates :text, presence: true

  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  def self.search(search)
    if search
      Post.where('game_name LIKE(?)', "%#{search}%")
      Post.where('game_hard LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

  mount_uploader :image, ImageUploader
end
