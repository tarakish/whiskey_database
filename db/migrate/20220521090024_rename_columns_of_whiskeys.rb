class RenameColumnsOfWhiskeys < ActiveRecord::Migration[6.1]
  def change
    rename_column :whiskeys, :reasonable_price, :price
    rename_column :whiskeys, :feeling_to_whiskey_with_tongue, :mouth_feel
  end
end
