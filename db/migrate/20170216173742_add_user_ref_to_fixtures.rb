class AddUserRefToFixtures < ActiveRecord::Migration[5.0]
  def change
    add_reference :fixtures, :user, foreign_key: true
  end
end
