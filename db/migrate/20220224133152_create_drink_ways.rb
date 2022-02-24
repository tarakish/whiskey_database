class CreateDrinkWays < ActiveRecord::Migration[6.1]
  def change
    create_table :drink_ways do |t|
      t.string :name
      t.text :how_to_make
      t.text :explantion

      t.timestamps
    end
  end
end
