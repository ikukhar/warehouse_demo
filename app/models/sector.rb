class Sector < ActiveRecord::Base
  belongs_to :warehouse
  has_many   :cells
  default_scope {order :number}

  def to_s
    "Сектор №#{self.number}"
  end
end
