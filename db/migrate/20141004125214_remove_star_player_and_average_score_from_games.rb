class RemoveStarPlayerAndAverageScoreFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :averageScore, :integer
    remove_column :games, :isStarPlayer, :boolean
  end
end
