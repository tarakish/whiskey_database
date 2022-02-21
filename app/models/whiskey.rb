# == Schema Information
#
# Table name: whiskeys
#
#  id                             :bigint           not null, primary key
#  description                    :text             not null
#  feeling_to_whiskey_with_tongue :integer          default("balanced"), not null
#  flavor_strength                :integer          default("normal"), not null
#  name                           :string           not null
#  rarity                         :integer          default("stable_supplyed"), not null
#  reasonable_price               :integer
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#
# Indexes
#
#  index_whiskeys_on_name  (name) UNIQUE
#
class Whiskey < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true #, uniqueness: true 必要そうであればコメントアウトする
  validates :feeling_to_whiskey_with_tongue, presence: true
  validates :flavor_strength, presence: true
  validates :rarity, presence: true
  

  enum feeling_to_whiskey_with_tongue: { light: 0, a_little_light: 1, balanced: 2, a_little_rich: 3, rich: 4 }
  enum flavor_strength: { delicate: 0, a_little_delicate: 1, normal: 2, a_little_smoky: 3, smoky: 4 }
  enum rarity: { rare: 0, a_little_rare: 1, stable_supplyed: 2 }
end
