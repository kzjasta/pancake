class AddTeamToActions < ActiveRecord::Migration[5.0]
  def change
    add_reference :actions, :team, foreign_key: true
  end
end
