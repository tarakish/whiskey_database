class CreateDrinkWays < ActiveRecord::Migration[6.1]
  def change
    create_table :drink_ways do |t|
      t.string :name, null: false
      t.text :how_to_make, null: false
      t.text :explanation, null: false

      t.timestamps
    end
    add_index :drink_ways, [:name, :how_to_make, :explanation], unique: true
  end
end
