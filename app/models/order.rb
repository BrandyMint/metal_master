class Order < ApplicationRecord
  include RankedModel
  COLORS = %w(#dff0d8 #d9edf7 #fcf8e3 #f2dede #d9534f #f0ad4e #5bc0de #5cb85c #0275d8)

  attribute :color, :string, default: COLORS.first

  has_many :order_machine_usages, dependent: :destroy
  has_many :machines, through: :order_machine_usages

  validates :title, presence: true, uniqueness: true

  scope :active, -> { where is_active: true }

  ranks :row_order
  scope :ordered, -> { rank :row_order }
  # accepts_nested_attributes_for :order_machines_usages, reject_if: :all_blank, allow_destroy: true

  def to_s
    "#{title} (#{order_machine_usages.count})"
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
