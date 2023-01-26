class Technician < ApplicationRecord
  has_many :appointments

  validates :name, presence: true
  validates :location, presence: true
  validates :chargers, presence: true
  validates :specialization, presence: true
  validates :image, presence: true
end
