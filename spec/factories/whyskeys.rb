# == Schema Information
#
# Table name: whyskeys
#
#  id                             :bigint           not null, primary key
#  description                    :text             not null
#  feeling_to_whiskey_with_tongue :integer          default(2)
#  flavor_strength                :integer          default(2)
#  name                           :string           not null
#  rarity                         :integer          default(0)
#  reasonable_price               :integer
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#
FactoryBot.define do
  factory :whyskey do
    name { "whiskey" }
    description { "this is whiskey" }
    feeling_to_whiskey_with_tongue { 1 }
    flavor_strength { 1 }
    rarity { 1 }
  end
end
