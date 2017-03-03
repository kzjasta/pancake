class RemoveHomeScoreFromFixtures < ActiveRecord::Migration[5.0]
  def change
    remove_column :fixtures, :home_score, :integer
    remove_column :fixtures, :away_score, :integer
  end
end
