class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :extension
      t.string :name
      t.string :email
      t.integer :averageScore
      t.boolean :isStarPlayer
      t.integer :wins
      t.integer :losses
      t.integer :draws

      t.timestamps
    end
  end
end
