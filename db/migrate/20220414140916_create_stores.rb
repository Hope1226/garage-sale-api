class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.references :seller, null: false, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
