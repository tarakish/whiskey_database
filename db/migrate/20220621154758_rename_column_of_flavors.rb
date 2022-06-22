class RenameColumnOfFlavors < ActiveRecord::Migration[6.1]
  def change
    rename_column :flavors, :group, :category
  end
end
