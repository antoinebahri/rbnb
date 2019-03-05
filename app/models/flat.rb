class Flat < ApplicationRecord
  validates :title, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validates :price_night, presence: true
  validates :picture, presence: true
end