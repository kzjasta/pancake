class CreateActions < ActiveRecord::Migration[5.0]
  def change
    create_table :actions do |t|
      t.references :player, foreign_key: true
      t.integer :position
      t.string :action_type
      t.string :action_result
      t.references :rally, foreign_key: true

      t.timestamps
    end
  end
end
