class AddLikeToCosmetics < ActiveRecord::Migration[5.2]
  def change
    add_column :cosmetics, :like, :integer, default: 0
  end
end
