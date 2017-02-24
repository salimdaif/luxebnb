class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  has_and_belongs_to_many :services
  validates :start_date, date: {
    after_or_equal_to: Proc.new { |obj| obj.availability.start_date},
    before_or_equal_to: Proc.new{ |obj| obj.availability.end_time}}
  validates :end_date, date: {
    after_or_equal_to: Proc.new { |obj| obj.availability.start_date},
    before_or_equal_to: Proc.new{ |obj| obj.availability.end_time}}


  def availability
    self.flat.availabilities.first
  end
end
