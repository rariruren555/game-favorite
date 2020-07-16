class Post < ApplicationRecord
  validates :game_name, presence: true
  validates :game_hard, presence: true
  validates :text, presence: true

  belongs_to :user

  mount_uploader :image, ImageUploader
end
