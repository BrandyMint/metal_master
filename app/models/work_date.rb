class WorkDate < ApplicationRecord
  DEFAULT_WORKERS = 15

  scope :ordered, -> { order :date, :exchange }

  attribute :workers, :integer, default: DEFAULT_WORKERS

  validates :exchange, uniqueness: { scope: :date }, presence: true
  validates :date, presence: true

  def is_business?
    workers > 0
  end
end
