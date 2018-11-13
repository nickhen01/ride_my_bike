class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bicycle
  validates :date_start, presence: true
  validates :date_end, presence: true
end
