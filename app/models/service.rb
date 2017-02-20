class Service < ApplicationRecord
  belongs_to :booking
  validates :price, :desc, presence: true
end
