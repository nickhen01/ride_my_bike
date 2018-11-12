class User < ApplicationRecord
  has_many :bicycles, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: ["owner", "cyclist"] }
end
