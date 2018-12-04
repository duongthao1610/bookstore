class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :quantity
      t.float :paideach
      t.integer :cart_id
      t.integer :cosmetic_id
      t.timestamps
    end
    add_index :cart_items, :cart_id
    add_index :cart_items, :cosmetic_id
    add_index :cart_items, [:cart_id, :cosmetic_id], unique: true
  end
end
