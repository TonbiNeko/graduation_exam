class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { in: 1..100 }
  validates :content, presence: true, length: { in: 1..1000 }
  belongs_to :user
  has_many :blog_images, dependent: :destroy
  accepts_nested_attributes_for :blog_images, 
                                 allow_destroy: true,
                                 reject_if: :all_blank
end
