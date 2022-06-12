class RemoveRelationFromTastingNote < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :tasting_notes , :flavors
    remove_reference :tasting_notes, :flavor, index: true
  end
end
