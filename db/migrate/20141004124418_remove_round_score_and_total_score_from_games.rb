class RemoveRoundScoreAndTotalScoreFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :roundScore, :integer
    remove_column :games, :totalScore, :integer
  end
end
