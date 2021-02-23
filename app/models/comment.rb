class Comment < ApplicationRecord
  belongs_to :blog
  belongs_to :user
  validates :content, presence: true, length: { in: 1..100 }
end
