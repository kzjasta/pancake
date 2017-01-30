class AddOwnerToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :owner, :string
  end
end
