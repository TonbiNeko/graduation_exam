class AddColumnsToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :name, :string, null: false
    add_column :places, :address, :text, null: false
    add_column :places, :description, :text, null: false
    add_column :places, :image, :text, null: false
  end
end
