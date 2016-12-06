class OrderMachineUsage < ApplicationRecord
  belongs_to :order
  belongs_to :machine

  has_many :order_machine_usage_intervals

  validates :machine_id, uniqueness: { scope: :order_id }

  accepts_nested_attributes_for :order_machine_usage_intervals, reject_if: :all_blank, allow_destroy: true

  def total_workers
    order_machine_usage_intervals.sum(:workers)
  end

  def average_workers_per_step
    return '-' if steps_count == 0
    (total_workers.to_f / steps_count).round(1)
  end

  def steps_count
    order_machine_usage_intervals.count
  end
end
