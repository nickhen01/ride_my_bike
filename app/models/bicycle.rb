class Bicycle < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :price, presence: true, numericality: { only_integer: true }
  validates_format_of :post_code, with: /\b((?:(?:gir)|(?:[a-pr-uwyz])(?:(?:[0-9](?:[a-hjkpstuw]|[0-9])?)|(?:[a-hk-y][0-9](?:[0-9]|[abehmnprv-y])?)))) ?([0-9][abd-hjlnp-uw-z]{2})\b/
  mount_uploader :photo, PhotoUploader
end
