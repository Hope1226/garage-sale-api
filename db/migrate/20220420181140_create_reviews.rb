class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :content, null: false
      t.references :customer, null: false, foreign_key: { to_table: :users }
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
