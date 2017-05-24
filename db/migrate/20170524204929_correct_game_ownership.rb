class CorrectGameOwnership < ActiveRecord::Migration[5.0]
  def change
    create_table :releases do |t|
      t.integer :game_id
      t.integer :system_id
      t.timestamps
    end

    create_table :publications do |t|
      t.integer :company_id
      t.integer :game_id
      t.timestamps
    end

    add_index :releases, :game_id
    add_index :releases, :system_id

    add_index :publications, :company_id
    add_index :publications, :game_id

    remove_column :systems, :game_id, :integer
  end
end
