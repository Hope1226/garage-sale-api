class RemoveUserFromStores < ActiveRecord::Migration[7.0]
  def change
    remove_reference :stores, :users, null: false, foreign_key: true
  end
end
