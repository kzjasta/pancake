class RenameFixtureIdIdToFixtureId < ActiveRecord::Migration[5.0]
  def change
    rename_column :match_sets, :fixture_id_id, :fixture_id
  end
end
