class Bicycle < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :price, presence: true, numericality: { only_integer: true }
  validates_format_of :post_code, with: /([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})/
  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :search_bikes,
    against: [:model, :brand, :description, :post_code],
    using: {
      tsearch: { prefix: true }
    }
end
