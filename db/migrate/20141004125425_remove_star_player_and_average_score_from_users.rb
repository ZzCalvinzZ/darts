class RemoveStarPlayerAndAverageScoreFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :averageScore, :integer
    remove_column :users, :isStarPlayer, :boolean
  end
end
