class Flat < ApplicationRecord
  mount_uploader :picture, PictureUploader

  validates :title, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validates :price_night, presence: true
  validates :picture, presence: true
  has_many :users, through: :bookings
  has_many :bookings
  belongs_to :user
end
