class Car < ApplicationRecord
  belongs_to :user

  validates :long, presence: true, numericality: { only_float: true }
  validates :lat, presence: true, numericality: { only_float: true }
end
