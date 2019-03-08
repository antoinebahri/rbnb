class Flat < ApplicationRecord
  mount_uploader :picture, PictureUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :title, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validates :price_night, presence: true
  validates :picture, presence: true
  has_many :users, through: :bookings
  belongs_to :user
end
