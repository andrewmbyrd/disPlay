class CreateSystems < ActiveRecord::Migration[5.0]
  def change
    create_table :systems do |t|
      t.string :name
      t.string :company
      t.integer :release_year

      t.timestamps
    end
  end
end
