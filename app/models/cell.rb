class Cell < ActiveRecord::Base
  belongs_to :sector
  default_scope {order :number}

  validates :number, numericality: { greater_than: 0 }
  validates :number, uniqueness: {scope: :sector}
  validates :sector, presence: true


  def to_s
    "Ячейка №#{self.number}"
  end
end
