class RemoveSystemIdFromGame < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :system_id, :integer
  end
end
