# == Schema Information
#
# Table name: drink_ways
#
#  id              :bigint           not null, primary key
#  english_name    :string           not null
#  explanation     :text             not null
#  how_to_make_url :text             not null
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
class DrinkWay < ApplicationRecord
  has_many :whiskeys

  validates :name, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :how_to_make_url, presence: true, uniqueness: true
  validates :explanation, presence: true, uniqueness: true
end
