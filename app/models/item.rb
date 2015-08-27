class Item < ActiveRecord::Base
  belongs_to :cell

  validates :count, :max_cell_count, numericality: { greater_than: 0 }
  validates :name, :foto_url, :cell, presence: true
end
