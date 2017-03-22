class RemoveRallyFromActions < ActiveRecord::Migration[5.0]
  def change
    remove_column :actions, :rally_id
  end
end
