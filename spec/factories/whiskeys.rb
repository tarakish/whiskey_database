# == Schema Information
#
# Table name: whiskeys
#
#  id                             :bigint           not null, primary key
#  description                    :text             not null
#  feeling_to_whiskey_with_tongue :integer          not null
#  flavor_strength                :integer          not null
#  name                           :string           not null
#  rarity                         :integer          not null
#  reasonable_price               :integer
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#
# Indexes
#
#  index_whiskeys_on_name  (name) UNIQUE
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
