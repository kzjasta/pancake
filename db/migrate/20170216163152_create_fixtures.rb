class CreateFixtures < ActiveRecord::Migration[5.0]
  def change
    create_table :fixtures do |t|
      t.references :team, foreign_key: true
      t.references :team, foreign_key: true
      t.datetime :date_time
      t.integer :home_score
      t.integer :away_score
      t.text :description
      t.references :venue, foreign_key: true

      t.timestamps
    end
  end
end
