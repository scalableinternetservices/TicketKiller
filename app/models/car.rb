class Car < ApplicationRecord
  validates :user_id, presence: true, uniqueness: true
  validates :long, presence: true, numericality: { only_float: true }
  validates :lat, presence: true, numericality: { only_float: true }
end
