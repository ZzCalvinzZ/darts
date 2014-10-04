class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :extension
      t.string :name
      t.string :email
      t.integer :average_score
      t.boolean :is_star_player, :default => false
      t.integer :wins, :default => '0'
      t.integer :losses, :default => '0'
      t.integer :draws, :default => '0'

      t.timestamps
    end
  end
end
