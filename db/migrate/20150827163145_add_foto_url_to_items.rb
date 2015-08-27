class AddFotoUrlToItems < ActiveRecord::Migration
  def change
    add_column :items, :foto_url, :string
  end
end
