class Availability < ApplicationRecord
  belongs_to :flat

  validates :start_date, :end_date, presence: true

end
