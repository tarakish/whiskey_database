# == Schema Information
#
# Table name: whyskeys
#
#  id                             :bigint           not null, primary key
#  description                    :text             not null
#  feeling_to_whiskey_with_tongue :integer          default("balanced"), not null
#  flavor_strength                :integer          default("normal"), not null
#  name                           :string           not null
#  rarity                         :integer          default("rare"), not null
#  reasonable_price               :integer
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#
class Whyskey < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  

  enum feeling_to_whiskey_with_tongue: { light: 0, a_little_light: 1, balanced: 2, a_little_rich: 3, rich: 4 }
  enum flavor_strength: { delicate: 0, a_little_delicate: 1, normal: 2, a_little_smoky: 3, smoky: 4 }
  enum rarity: { rare: 0, a_little_rare: 1, stable_supplyed: 2 }

end
