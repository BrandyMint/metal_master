class Order < ApplicationRecord
  has_many :order_machines_usages

  validates :title, presence: true, uniqueness: true
end
