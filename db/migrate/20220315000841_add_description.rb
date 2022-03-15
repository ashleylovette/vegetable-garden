class AddDescription < ActiveRecord::Migration[6.0]
  def change
    add_column :vegetables, :conditions, :text
  end
end
