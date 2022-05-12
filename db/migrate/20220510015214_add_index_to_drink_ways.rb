class AddIndexToDrinkWays < ActiveRecord::Migration[6.1]
  def change
    add_index :drink_ways, :name, unique: true
    add_index :drink_ways, :explanation, unique: true
    add_index :drink_ways, :how_to_make_url, unique: true
    add_index :drink_ways, :english_name, unique: true
  end
end
