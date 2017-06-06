class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :action
      t.references :game_purchase, foreign_key: true

      t.timestamps
    end
  end
end
