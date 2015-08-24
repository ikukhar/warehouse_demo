class AddSectorToCells < ActiveRecord::Migration
  def change
    add_column :cells, :sector_id, :integer
    add_index  :cells, :sector_id
  end
end
