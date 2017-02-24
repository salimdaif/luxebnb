class Booking < ApplicationRecord
  has_many :bills, dependent: :destroy
  belongs_to :user
  belongs_to :flat
  has_and_belongs_to_many :services
  validates :start_date, date: {
    after_or_equal_to: Proc.new { |obj| obj.availability.start_date},
    before_or_equal_to: Proc.new{ |obj| obj.availability.end_time}}
  validates :end_date, date: {
    after_or_equal_to: Proc.new { |obj| obj.availability.start_date},
    before_or_equal_to: Proc.new{ |obj| obj.availability.end_time}}

  after_save :create_bill

  def availability
    self.flat.availabilities.first
  end

  def calculate_bill
    days = (self.end_date.to_date - self.start_date.to_date).to_i

    bill_preview = days * self.flat.price_night

    self.services.each do |service|
      bill_preview += service.price * days
    end

    bill_preview
  end

  private
  def create_bill
      bill = self.bills.new

      previous_total = self.bills.map(&:price).inject(:+).to_f
      bill.price = calculate_bill - previous_total.abs

      bill.save
  end
end
