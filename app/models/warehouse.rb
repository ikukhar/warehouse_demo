class Warehouse < ActiveRecord::Base

  has_many :sectors, dependent: :destroy
  default_scope { order :number}

  validates :number, numericality: { greater_than: 0 }
  validates :number, uniqueness: true

  def to_s
    "Склад №#{self.number}"
  end

  def self.search(search)
    if search && (not search.empty?)
      where('number = ?', "#{search}")
    else
      all
    end
  end

end
