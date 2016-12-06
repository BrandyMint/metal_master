class OrderMachineUsageInterval < ApplicationRecord
  MAXIMAL_WORKERS = 100

  scope :ordered, -> { order :step }

  belongs_to :order_machine_usage

  validates :workers, presence: true, numericality: { greater_than_or_equal_to: 1, less_than: MAXIMAL_WORKERS }
  validates :step, presence: true, uniqueness: { scope: :order_machine_usage_id }
end
