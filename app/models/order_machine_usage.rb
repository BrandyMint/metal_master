class OrderMachineUsage < ApplicationRecord
  extend Enumerize

  belongs_to :order
  belongs_to :machine

  belongs_to :after_machine_usage, class_name: self.name

  has_many :order_machine_usage_intervals

  # none - нет условий для старта, может стратовать с начала процесса
  # after_finish - может стартовать только после окончания указанного оборудования
  # after_start - может стартовать только после указанного количества шагов (after_steps) после начала указанного использования
  # указанного оборудования
  enumerize :start_condition, in: [:none, :after_finish, :after_start], default: :none

  validates :machine_id, uniqueness: { scope: :order_id }

  validates :after_machine_usage, presence: true, if: :after_condition?

  accepts_nested_attributes_for :order_machine_usage_intervals, reject_if: :all_blank, allow_destroy: true

  # Применяется в выпадашке
  def to_s
    machine.to_s
  end

  def total_workers
    order_machine_usage_intervals.sum(:workers)
  end

  def after_condition?
    start_condition == :after_finish || start_condition == :after_start
  end

  def average_workers_per_step
    return '-' if steps_count == 0
    (total_workers.to_f / steps_count).round(1)
  end

  def steps_count
    order_machine_usage_intervals.count
  end
end
