# == Schema Information
#
# Table name: flavors
#
#  id         :bigint           not null, primary key
#  detail     :string           not null
#  group      :integer
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_flavors_on_name_and_detail  (name,detail) UNIQUE
#
class Flavor < ApplicationRecord
  has_many :tasting_notes
  has_many :whiskey_flavors
  has_many :whiskeys, through: :whiskey_flavors

  validates :name, presence: true, uniqueness: true
  validates :detail, presence: true, uniqueness: true
  validates :group, presence: true

  enum group: { woody: 0, winy: 1, fruity: 2, floral: 3, sereal: 4, smoky: 5 }
end
