class Order < ApplicationRecord
  has_many :order_machine_usages, dependent: :destroy
  has_many :machines, through: :order_machine_usages

  validates :title, presence: true, uniqueness: true

  # accepts_nested_attributes_for :order_machines_usages, reject_if: :all_blank, allow_destroy: true

  def to_s
    "[#{id}] #{title}"
  end

  def total_workers
    order_machine_usages.inject(0) { |sum,u| sum + u.total_workers }
  end

  def average_workers_per_step
    return '-' if steps_count == 0
    (total_workers.to_f / steps_count).round(1)
  end

  def steps_count
    order_machine_usages.inject(0) { |sum,u| sum + u.steps_count }
  end
end
