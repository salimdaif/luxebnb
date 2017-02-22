class Service < ApplicationRecord
  has_and_belongs_to_many :bookings
  validates :price, :desc, presence: true

  def full_description
    "#{desc} : $#{price}"
  end
end
