class Sector < ActiveRecord::Base
  belongs_to :warehouse
  has_many   :cells
  default_scope {order :number}

  validates :number, numericality: { grater_than: 0 }
  validates :number, uniqueness: {scope: :warehouse}
  validates :warehouse, presence: true

  def to_s
    "Сектор №#{self.number}"
  end
end
