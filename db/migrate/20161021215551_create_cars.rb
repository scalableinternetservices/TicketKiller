class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.integer :user_id
      t.float :long
      t.float :lat

      t.timestamps
    end
  end
end
