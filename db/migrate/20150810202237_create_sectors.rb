class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.integer :number

      t.timestamps null: false
    end
  end
end
