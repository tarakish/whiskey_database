class AddColumnForUploader < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :avatar, :string
    add_column :drink_ways, :image, :string
    add_column :snacks, :image, :string
  end
end
