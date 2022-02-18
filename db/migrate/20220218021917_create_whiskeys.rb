class CreateWhiskeys < ActiveRecord::Migration[6.1]
  def change
    create_table :whiskeys do |t|
      t.string :name, null:false
      t.text :description, null:false
      t.integer :feeling_to_whiskey_with_tongue, null:false
      t.integer :flavor_strength, null:false
      t.integer :rarity, null:false
      t.integer :reasonable_price

      t.timestamps
    end
    add_index :whiskeys, [:name], unique: true
  end
end
