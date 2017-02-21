class Availability < ApplicationRecord
  belongs_to :flat

  validates :start_date, :end_time, presence: true

end
