# == Schema Information
#
# Table name: whiskeys
#
#  id                     :bigint           not null, primary key
#  amazon_image_link      :string           not null
#  amazon_impression_link :string           not null
#  amazon_link            :text             not null
#  description            :text             not null
#  flavor_strength        :integer          default("normal"), not null
#  mouth_feel             :integer          default("balanced"), not null
#  name                   :string           not null
#  price                  :integer
#  processing             :integer          default("single_malt"), not null
#  rarity                 :integer          default("stable_supplyed"), not null
#  region                 :integer          default("scotch"), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  drink_way_id           :bigint
#  snack_id               :bigint
#
# Indexes
#
#  index_whiskeys_on_amazon_image_link       (amazon_image_link) UNIQUE
#  index_whiskeys_on_amazon_impression_link  (amazon_impression_link) UNIQUE
#  index_whiskeys_on_amazon_link             (amazon_link) UNIQUE
#  index_whiskeys_on_drink_way_id            (drink_way_id)
#  index_whiskeys_on_name                    (name) UNIQUE
#  index_whiskeys_on_snack_id                (snack_id)
#
# Foreign Keys
#
#  fk_rails_...  (drink_way_id => drink_ways.id)
#  fk_rails_...  (snack_id => snacks.id)
#
require 'rails_helper'

RSpec.describe Whiskey, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
