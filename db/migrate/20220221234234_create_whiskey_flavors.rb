class CreateWhiskeyFlavors < ActiveRecord::Migration[6.1]
  def change
    create_table :whiskey_flavors do |t|
      t.references :whiskey, null: false, foreign_key: true
      t.references :flavor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
