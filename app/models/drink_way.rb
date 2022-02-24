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
class DrinkWay < ApplicationRecord
  has_many :whiskeys, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :how_to_make, presence: true, uniqueness: true
  validates :explanation, presence: true, uniqueness: true
end
