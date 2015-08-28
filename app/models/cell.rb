class Cell < ActiveRecord::Base

  belongs_to :sector
  has_one    :item
  default_scope {order :number}

  validates :number, numericality: { greater_than: 0 }
  validates :number, uniqueness: {scope: :sector}
  validates :sector, presence: true


  def to_s
    "Ячейка №#{self.number}"
  end

  def self.search(search)
    if search && (not search.empty?)
      where('number = ?', "#{search}")
    else
      all
    end
  end

end
