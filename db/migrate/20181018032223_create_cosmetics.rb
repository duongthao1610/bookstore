class CreateCosmetics < ActiveRecord::Migration[5.2]
  def change
    create_table :cosmetics do |t|
      t.string :name
      t.float :price
      t.integer :quantity_in_store
      t.string :image
      t.text :description
      t.integer :category_id
      t.integer :trademark_id
      t.timestamps
    end
  end
end
