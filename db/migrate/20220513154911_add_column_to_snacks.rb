class AddColumnToSnacks < ActiveRecord::Migration[6.1]
  def change
    add_column :snacks, :english_name, :string, null: false
    add_index :snacks, :english_name, unique: true
  end
end
