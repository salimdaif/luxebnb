class Flat < ApplicationRecord

  validates :capacity, :room_number, :bed_number, :price_night, :title,
  :bathroom_number, :desc, presence: true
  belongs_to :user
  has_many :bookings
  has_many :availabilities, dependent: :destroy
end
