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
require 'rails_helper'

RSpec.describe Whiskey, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
