class Machine < ApplicationRecord
  validates :title, presence: true, uniqueness: true
end
