class RemoveUserIdFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :user_id
  end
end
