class AddStockUomToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :stock, :integer, null: false
    add_column :products, :uom, :string, null: false
  end
end
