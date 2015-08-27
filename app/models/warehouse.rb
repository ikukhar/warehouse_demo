class Warehouse < ActiveRecord::Base
  has_many :sectors
  default_scope { order :number}

  validates :number, numericality: { greater_than: 0 }
  validates :number, uniqueness: true

  def to_s
    "Склад №#{self.number}"
  end
end
