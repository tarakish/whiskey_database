# == Schema Information
#
# Table name: drink_ways
#
#  id              :bigint           not null, primary key
#  english_name    :string           not null
#  explanation     :text             not null
#  how_to_make_url :text             not null
#  image           :string
#  name            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_drink_ways_on_english_name     (english_name) UNIQUE
#  index_drink_ways_on_explanation      (explanation) UNIQUE
#  index_drink_ways_on_how_to_make_url  (how_to_make_url) UNIQUE
#  index_drink_ways_on_name             (name) UNIQUE
#
require 'rails_helper'

RSpec.describe DrinkWay, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
