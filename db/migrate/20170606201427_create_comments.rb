class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :game_purchase, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
