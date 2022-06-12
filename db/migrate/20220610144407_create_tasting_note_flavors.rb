class CreateTastingNoteFlavors < ActiveRecord::Migration[6.1]
  def change
    create_table :tasting_note_flavors do |t|
      t.references :tasting_note, null: false, foreign_key: true
      t.references :flavor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
