class AddGameToSystems < ActiveRecord::Migration[5.0]
  def change
    add_column :systems, :game_id, :integer
    add_index :systems, :game_id  
  end
end
