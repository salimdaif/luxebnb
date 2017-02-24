class Availability < ApplicationRecord
  belongs_to :flat

  validates :start_date, :end_time, presence: true
  validates :start_date, date: {after: Proc.new {Date.today}}
  validates :end_time, date: { after: Proc.new { |obj| obj.start_date}}

end
