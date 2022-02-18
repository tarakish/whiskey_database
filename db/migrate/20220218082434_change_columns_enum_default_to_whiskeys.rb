class ChangeColumnsEnumDefaultToWhiskeys < ActiveRecord::Migration[6.1]
  def change
    change_column_default :whiskeys, :feeling_to_whiskey_with_tongue, 2
    change_column_default :whiskeys, :flavor_strength, 2
    change_column_default :whiskeys, :rarity, 2
  end
end
