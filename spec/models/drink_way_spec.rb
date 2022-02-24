# == Schema Information
#
# Table name: drink_ways
#
#  id          :bigint           not null, primary key
#  explanation :text             not null
#  how_to_make :text             not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_drink_ways_on_name_and_how_to_make_and_explanation  (name,how_to_make,explanation) UNIQUE
#
require 'rails_helper'

RSpec.describe DrinkWay, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
