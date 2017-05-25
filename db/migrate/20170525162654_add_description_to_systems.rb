class AddDescriptionToSystems < ActiveRecord::Migration[5.0]
  def change
    add_column :systems, :description, :string
  end
end
