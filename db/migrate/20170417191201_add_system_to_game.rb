class AddSystemToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :system_id, :integer
    add_index :games, :system_id
  end
end
