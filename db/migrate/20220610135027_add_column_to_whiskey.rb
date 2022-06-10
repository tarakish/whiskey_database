class AddColumnToWhiskey < ActiveRecord::Migration[6.1]
  def change
    remove_column :whiskeys, :region, :string
    add_column :whiskeys, :region, :integer, null: false, default: 0
    add_column :whiskeys, :processing, :integer, null: false, default: 0
  end
end
