class AddNameToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :name, :string, :default => "My Car"
  end
end
