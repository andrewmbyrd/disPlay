class CorrectFollowerId < ActiveRecord::Migration[5.0]
  def change
    remove_column :relationships, :follwer_id, :integer
    add_column :relationships, :follower_id, :integer
  end
end
