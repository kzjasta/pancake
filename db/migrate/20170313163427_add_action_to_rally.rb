class AddActionToRally < ActiveRecord::Migration[5.0]
  def change
    add_reference :rallies, :action, foreign_key: true
  end
end
