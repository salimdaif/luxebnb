class Flat < ApplicationRecord

  validates :capacity, :room_number, :bed_number, :price_night, :title,
  :bathroom_number, :desc, presence: true
  belongs_to :user
  has_many :bookings
  has_many :availabilities, dependent: :destroy
  
  def self.search(params)
    Flat.joins(:availabilities).where(
        'start_date >= :startd AND
        end_time <= :end AND
        city = :city AND
        capacity >= :capacity',{startd: params[:start_date], end: params[:end_time], city: params[:city], capacity: params[:capacity]}
      )
  end
end
