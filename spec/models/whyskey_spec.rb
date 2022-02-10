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
require 'rails_helper'

RSpec.describe Whyskey, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
