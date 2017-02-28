class CreateMatchSets < ActiveRecord::Migration[5.0]
  def change
    create_table :match_sets do |t|
      t.integer :set_number
      t.references :fixture_id, foreign_key: true

      t.timestamps
    end
  end
end
