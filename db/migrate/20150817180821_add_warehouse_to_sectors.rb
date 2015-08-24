class AddWarehouseToSectors < ActiveRecord::Migration
  def change
    add_column :sectors, :warehouse_id, :integer
    add_index  :sectors, :warehouse_id
  end
end
