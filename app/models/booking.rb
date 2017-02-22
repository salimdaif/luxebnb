class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  has_and_belongs_to_many :services

  validates :start_date, :end_date, presence: true

end
