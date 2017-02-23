class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  has_and_belongs_to_many :services

  validates :start_date, :end_date, presence: true
  validate :end_date_is_greater_than_start_date

  private
  def end_date_is_greater_than_start_date
    return if start_date.nil? && end_date.nil?

    if start_date > end_date
      errors.add(:start_date, "can't be greater than end date" )
    end
  end
end
