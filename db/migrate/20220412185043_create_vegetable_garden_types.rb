class CreateVegetableGardenTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :vegetable_garden_types do |t|
      t.integer :vegetable_id
      t.integer :garden_type_id
    end
  end
end
