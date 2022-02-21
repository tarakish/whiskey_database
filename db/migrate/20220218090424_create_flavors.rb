class CreateFlavors < ActiveRecord::Migration[6.1]
  def change
    create_table :flavors do |t|
      t.string :name, null: false
      t.string :detail, null: false
      t.integer :group, null:false, default: 0

      t.timestamps
    end
    add_index :flavors, [:name, :detail], unique: true
  end
end
