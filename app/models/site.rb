class Site < ApplicationRecord
  belongs_to :machine
  has_many :order_machine_usages, through: :machine
  has_many :orders, through: :order_machine_usages

  validates :title, presence: true, uniqueness: { scope: :machine_id }
end
