class Bicycle < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :price, presence: true, numericality: { only_integer: true }
  validates :photo, presence: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :post_code, presence: true
  validates :description, presence: true
  validates_format_of :post_code, with: /([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})/
  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :search_bikes,
    against: [:model, :brand, :description, :post_code, :area, :price],
    using: {
      tsearch: { prefix: true }
    }
end
