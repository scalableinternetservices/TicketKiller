class CreateOfficers < ActiveRecord::Migration[5.0]
  def change
    create_table :officers do |t|
      t.float :lat
      t.float :long
      t.timestamp :last_seen

      t.timestamps
    end
  end
end
