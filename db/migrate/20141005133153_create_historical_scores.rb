class CreateHistoricalScores < ActiveRecord::Migration
  def change
    create_table :historical_scores do |t|
      t.integer     "score"
      t.timestamps
    end
  end
end
