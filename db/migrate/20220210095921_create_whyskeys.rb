class CreateWhyskeys < ActiveRecord::Migration[6.1]
  def change
    create_table :whyskeys do |t|
      t.string :name, null: false, unique: true
      t.text :description, null: false, unique: true
      t.integer :feeling_to_whiskey_with_tongue, null: false, default: 2
      t.integer :flavor_strength, null: false, default: 2
      t.integer :rarity, null: false, default: 0
      t.integer :reasonable_price 

      t.timestamps
    end
  end
end
