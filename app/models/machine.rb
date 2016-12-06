class Machine < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  def to_s
    title
  end
end
