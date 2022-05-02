class CreateSnacks < ActiveRecord::Migration[6.1]
  def change
    create_table :snacks do |t|
      t.string :name, null: false
      t.text :description, null: false

      t.timestamps
    end
    add_index :snacks, [:name, :description], unique: true
  end
end
