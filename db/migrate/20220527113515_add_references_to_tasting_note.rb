class AddReferencesToTastingNote < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasting_notes, :whiskey, null: false, foreign_key: true
  end
end
