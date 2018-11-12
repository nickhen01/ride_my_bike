class Bicycle < ApplicationRecord
  belongs_to :user
  validates :price, presence: true, numericality: { only_integer: true }
end
