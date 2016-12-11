class Site < ApplicationRecord
  include RankedModel

  belongs_to :machine
  has_many :order_machine_usages, through: :machine
  has_many :orders, through: :order_machine_usages

  ranks :row_order
  scope :ordered, -> { rank :row_order }

  validates :title, presence: true, uniqueness: { scope: :machine_id }
end
