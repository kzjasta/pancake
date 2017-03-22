class ChangeActionToTouch < ActiveRecord::Migration[5.0]
  def change
    rename_table :actions, :touches
    rename_column :touches, :action_type, :touch_type
    rename_column :touches, :action_result, :touch_result
    rename_column :match_sets, :action_id, :touch_id
  end
end
