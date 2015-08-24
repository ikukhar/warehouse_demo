class Warehouses < ActiveRecord::Migration
  def change
    remove_column :warehouses, :name
    add_column    :warehouses, :number, :string
  end
end
