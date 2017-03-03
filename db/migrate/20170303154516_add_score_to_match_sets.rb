class AddScoreToMatchSets < ActiveRecord::Migration[5.0]
  def change
    add_column :match_sets, :home_score, :integer
    add_column :match_sets, :away_score, :integer
  end
end
