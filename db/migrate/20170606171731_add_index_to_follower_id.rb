class AddIndexToFollowerId < ActiveRecord::Migration[5.0]
  def change
    add_index :relationships, :follower_id
  end
end
