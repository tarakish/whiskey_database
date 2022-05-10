class UpdateColumnWithDrinkWays < ActiveRecord::Migration[6.1]
  def change
    remove_column :drink_ways, :how_to_make, :text
    add_column :drink_ways, :how_to_make_url, :text, null: false
    add_column :drink_ways, :english_name, :string, null: false
  end
end
