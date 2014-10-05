class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :round_count, :default => '0'
      t.integer :player_1_total_score, :default => '0'
      t.integer :player_2_total_score, :default => '0'

      t.timestamps
    end
  end
end
