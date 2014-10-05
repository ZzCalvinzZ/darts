class AddHistoricalScoresAssociationToUser < ActiveRecord::Migration
  def self.up
      add_column :historical_scores, :user_id, :integer
      add_index 'historical_scores', ['user_id'], :name => 'index_user_id' 
  end

  def self.down
      remove_column :historical_scores, :user_id
  end
end
