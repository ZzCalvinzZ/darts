class AddRoundScoreAndTotalScoreToGames < ActiveRecord::Migration
  def change
    add_column :games, :player_1_round_score, :integer
    add_column :games, :player_1_total_score, :integer
    add_column :games, :player_2_round_score, :integer
    add_column :games, :player_2_total_score, :integer
  end
end
