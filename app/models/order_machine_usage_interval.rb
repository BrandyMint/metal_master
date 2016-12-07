class OrderMachineUsageInterval < ApplicationRecord
  include RankedModel

  MAXIMAL_WORKERS = 100

  scope :ordered, -> { order :row_order }

  belongs_to :order_machine_usage, required: false

  ranks :row_order, with_same: :order_machine_usage_id

  validates :workers, presence: true, numericality: { greater_than_or_equal_to: 1, less_than: MAXIMAL_WORKERS }
end
