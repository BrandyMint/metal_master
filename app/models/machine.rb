# Техпроцесс
#
class Machine < ApplicationRecord
  include RankedModel
  has_many :order_machine_usages, dependent: :restrict_with_error
  has_many :orders, through: :order_machine_usages
  has_many :sites

  validates :title, presence: true, uniqueness: true

  ranks :row_order
  scope :ordered, -> { rank :row_order }

  def to_s
    title
  end
end
