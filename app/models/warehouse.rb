class Warehouse < ActiveRecord::Base
  has_many :sectors
  default_scope { order :number}

  def to_s
    "Склад №#{self.number}"
  end
end
