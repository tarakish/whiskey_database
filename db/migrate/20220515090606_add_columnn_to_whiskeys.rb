class AddColumnnToWhiskeys < ActiveRecord::Migration[6.1]
  def change
    add_column :whiskeys, :region, :string, null: false

    add_column :whiskeys, :amazon_link, :text, null: false
    add_index :whiskeys, :amazon_link, unique: true

    add_column :whiskeys, :amazon_image_link, :string, null: false
    add_index :whiskeys, :amazon_image_link, unique: true

    add_column :whiskeys, :amazon_impression_link, :string, null: false
    add_index :whiskeys, :amazon_impression_link, unique: true
  end
end
