class AddCurrentGameScoreToUser < ActiveRecord::Migration
  def change
    add_column :users, :current_game_score, :integer, default: 0
  end
end
