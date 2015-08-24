class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :count
      t.integer :max_cell_count

      t.timestamps null: false
    end
  end
end
