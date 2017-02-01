class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.integer :height
      t.integer :weight
      t.string :position
      t.integer :spike_reach
      t.integer :block_reach
      t.string :nationality
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
