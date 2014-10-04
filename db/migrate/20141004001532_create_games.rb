class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :roundScore
      t.integer :totalScore

      t.timestamps
    end
  end
end
