class Bicycle < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :price, presence: true, numericality: { only_integer: true }
  mount_uploader :photo, PhotoUploader
end
