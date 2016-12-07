class Machine < ApplicationRecord
  has_many :order_machine_usages, dependent: :restrict_with_error
  has_many :orders, through: :order_machine_usages

  validates :title, presence: true, uniqueness: true

  def to_s
    title
  end
end
