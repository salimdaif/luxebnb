class Flat < ApplicationRecord

  validates :capacity, :room_number, :bed_number, :price_night, :title,
  :bathroom_number, :desc, prescence: true
  belongs_to :user
  has_many :book
  has_many :availabilities
end
