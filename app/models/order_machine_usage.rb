class OrderMachineUsage < ApplicationRecord
  belongs_to :order
  belongs_to :machine
end
