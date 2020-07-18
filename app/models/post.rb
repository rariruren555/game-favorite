class Post < ApplicationRecord
  validates :game_name, presence: true
  validates :game_hard, presence: true
  validates :text, presence: true

  belongs_to :user
  has_many :comments

  mount_uploader :image, ImageUploader
end
