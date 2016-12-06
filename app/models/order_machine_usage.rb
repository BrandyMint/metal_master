class OrderMachineUsage < ApplicationRecord
  extend Enumerize

  MAXIMAL_STEPS = 20

  belongs_to :order
  belongs_to :machine

  # Предыдущий шаг
  belongs_to :after_machine_usage, class_name: self.name, required: false

  # Следующие шаги
  has_many :before_linked_usages,
    class_name: self.name,
    inverse_of: :after_machine_usage,
    foreign_key: :after_machine_usage_id

  has_many :order_machine_usage_intervals

  # none - нет условий для старта, может стратовать с начала процесса
  # after_finish - может стартовать только после окончания указанного оборудования
  # after_start - может стартовать только после указанного количества шагов (skip_steps) после начала указанного использования
  # указанного оборудования
  enumerize :start_condition,
    in: [:none, :after_finish, :after_start],
    default: :none,
    predicates: true,
    scope: true

  validates :machine_id, uniqueness: { scope: :order_id }
  validates :after_machine_usage, presence: true, if: :after_condition?
  validates :skip_steps,
    presence: true,
    numericality: { greater_than_or_equal_to: 1, less_than: MAXIMAL_STEPS },
    if: :after_start?

  accepts_nested_attributes_for :order_machine_usage_intervals,
    reject_if: :all_blank,
    allow_destroy: true

  # Применяется в выпадашке
  def to_s
    machine.to_s
  end

  def start_step
    case start_condition
    when 'none'
      0
    when 'after_finish'
      after_machine_usage.last_step
    when 'after_start'
      after_machine_usage.start_step + skip_steps
    end
  end

  def last_step
    start_step + steps_count
  end

  def total_inclusive_stops_count
    [last_step, before_linked_usages.map(&:total_inclusive_stops_count)].flatten.max
  end

  def total_workers
    order_machine_usage_intervals.sum(:workers)
  end

  def after_condition?
    after_finish? || after_start?
  end

  def average_workers_per_step
    return '-' if steps_count == 0
    (total_workers.to_f / steps_count).round(1)
  end

  def steps
    order_machine_usage_intervals
  end

  def steps_count
    order_machine_usage_intervals.count
  end
end
