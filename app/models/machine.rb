# Техпроцесс
#
class Machine < ApplicationRecord
  include RankedModel
  has_many :order_machine_usages, dependent: :restrict_with_error
  has_many :orders, through: :order_machine_usages
  has_many :sites, dependent: :destroy

  ranks :row_order
  scope :ordered, -> { rank :row_order }

  validates :title, presence: true, uniqueness: true

  accepts_nested_attributes_for :sites, reject_if: :all_blank, allow_destroy: true

  def to_s
    title
  end
end
