class AddIndexToOfficers < ActiveRecord::Migration[5.0]
  def change
    add_index :officers, :lat
    add_index :officers, :long
  end
end
