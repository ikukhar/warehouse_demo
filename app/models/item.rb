class Item < ActiveRecord::Base

  belongs_to :cell

  validates :count, :max_cell_count, numericality: { greater_than_or_equal_to: 0 }
  validates :count, numericality: { less_than_or_equal_to: :max_cell_count }
  validates :name, :foto_url, :cell, presence: true

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end

end
