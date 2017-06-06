class AddOtherUserToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :commentee, :integer
  end
end
