class BlogImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :blog
end
