class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { in: 1..100 }
  validates :content, presence: true, length: { in: 1..1000 }
end
