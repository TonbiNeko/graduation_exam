class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :blogs
  validates :name, presence: true
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
