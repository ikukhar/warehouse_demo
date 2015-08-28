class Sector < ActiveRecord::Base

  belongs_to :warehouse
  has_many   :cells
  default_scope {order :number}

  validates :number, numericality: { greater_than: 0 }
  validates :number, uniqueness: {scope: :warehouse}
  validates :warehouse, presence: true

  def to_s
    "Сектор №#{self.number}"
  end

  def self.search(search)
    if search && (not search.empty?)
      where('number = ?', "#{search}")
    else
      all
    end
  end

end
