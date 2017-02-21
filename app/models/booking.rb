class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  has_many :services

  validates :start_date, :end_time, presence: true

end
