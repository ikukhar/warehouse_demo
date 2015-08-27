class AddCellToItem < ActiveRecord::Migration
  def change
    add_column :items, :cell_id, :integer
    add_index  :items, :cell_id
  end
end
