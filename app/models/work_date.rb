class WorkDate < ApplicationRecord
  scope :ordered, -> { order :date }

  validates :date, uniqueness: true
end
