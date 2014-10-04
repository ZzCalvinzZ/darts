class AddStarPlayerAndAverageScoreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :average_score, :integer
    add_column :users, :is_star_player, :boolean
  end
end
