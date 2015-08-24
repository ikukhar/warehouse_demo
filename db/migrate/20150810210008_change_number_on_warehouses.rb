class ChangeNumberOnWarehouses < ActiveRecord::Migration
  def change
    remove_column :warehouses, :number
    add_column    :warehouses, :number, :ineger
  end
end
