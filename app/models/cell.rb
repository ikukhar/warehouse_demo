class Cell < ActiveRecord::Base
  belongs_to :sector
  default_scope {order :number}

  def to_s
    "Ячейка №#{self.number}"
  end
end
