class Place < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  validates :address, presence: true
  has_one :rule, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :rule, 
                                allow_destroy: true,
                                reject_if: :all_blank
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
