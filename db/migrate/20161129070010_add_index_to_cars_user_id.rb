class AddIndexToCarsUserId < ActiveRecord::Migration[5.0]
  def change
    add_index :cars, :user_id
  end
end
