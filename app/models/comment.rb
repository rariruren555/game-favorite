class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
 edit-ajax-comment

  
master
  validates :text, presence: true
end
