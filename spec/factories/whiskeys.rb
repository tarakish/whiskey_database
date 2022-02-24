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
#  drink_way_id                   :bigint
#
# Indexes
#
#  index_whiskeys_on_drink_way_id  (drink_way_id)
#  index_whiskeys_on_name          (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (drink_way_id => drink_ways.id)
#
FactoryBot.define do
  factory :whiskey do
    name { "MyString" }
    description { "MyText" }
    feeling_to_whiskey_with_tongue { 1 }
    flavor_strength { 1 }
    rarity { 1 }
    reasonable_price { 1 }
  end
end
