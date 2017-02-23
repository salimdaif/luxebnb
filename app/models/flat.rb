class Flat < ApplicationRecord

  validates :capacity, :room_number, :bed_number, :price_night, :title,
  :bathroom_number, :desc, presence: true
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  accepts_nested_attributes_for :availabilities

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_attachments :photos, maximum: 20

  def self.search(params)

    results = Flat.joins(:availabilities)

    results = results.where("start_date >= ?", params[:start_date]) if params[:start_date].present?
    results = results.where("end_time >= ?", params[:end_time]) if params[:end_time].present?
    results = results.where("city LIKE ?", "%#{params[:city]}%") if params[:city].present?
    results = results.where("capacity >= ?", params[:capacity]) if params[:capacity].present?

    # params[:start_date] = params[:start_date].present? ? params[:start_date] : Time.now.strftime("%Y-%m-%d")
    # params[:end_time] = params[:end_time].present? ? params[:end_time] : (Time.now + 30.days).strftime("%Y-%m-%d")
    # params[:capacity] = params[:capacity].present? ? params[:capacity] : 1

    # Flat.joins(:availabilities).where(
    #     "start_date >= :startd AND
    #     end_time <= :end AND
    #     city LIKE %:city% AND
    #     capacity >= :capacity",{
    #     startd: params[:start_date], end: params[:end_time], city: params[:city], capacity: params[:capacity]}
    #   )

    results
  end
end
