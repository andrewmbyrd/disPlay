class DropPublicationsTabe < ActiveRecord::Migration[5.0]
  def change
    drop_table :publications
  end
end
