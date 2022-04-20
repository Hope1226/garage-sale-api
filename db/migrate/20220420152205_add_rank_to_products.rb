class AddRankToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :rank, :decimal, default: 0.00
  end
end
