class AddUserIdToVeggies < ActiveRecord::Migration[6.0]
  def change
    add_column :vegetables, :user_id, :int
  end
end
