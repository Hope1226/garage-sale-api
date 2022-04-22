class AddCategoryToStores < ActiveRecord::Migration[7.0]
  def change
    add_column :stores, :category, :string, null: false
  end
end
