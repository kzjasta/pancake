class AddMatchSetToAction < ActiveRecord::Migration[5.0]
  def change
    add_reference :actions, :match_set, foreign_key: true
  end
end
