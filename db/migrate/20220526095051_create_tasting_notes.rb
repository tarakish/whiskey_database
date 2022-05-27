class CreateTastingNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :tasting_notes do |t|
      t.string :comment, null: false
      t.references :user, null: false, foreign_key: true
      t.references :drink_way, null: false, foreign_key: true
      t.references :flavor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
