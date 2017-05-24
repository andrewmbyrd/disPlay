class AddPurchasesToLibrary < ActiveRecord::Migration[5.0]
  def change
    create_table :game_purchases do |t|
      t.integer :library_id
      t.integer :game_id
      t.timestamps
    end

    create_table :system_purchases do |t|
      t.integer :library_id
      t.integer :system_id
      t.timestamps
    end

    add_index :game_purchases, :library_id
    add_index :game_purchases, :game_id
    add_index :system_purchases, :library_id
    add_index :system_purchases, :system_id
  end
end
