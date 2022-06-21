# == Schema Information
#
# Table name: flavors
#
#  id         :bigint           not null, primary key
#  category   :integer          default(0), not null
#  detail     :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_flavors_on_name_and_detail  (name,detail) UNIQUE
#
class Flavor < ApplicationRecord
  has_many :whiskey_flavors
  has_many :whiskeys, through: :whiskey_flavors
  has_many :tasting_note_flavors
  has_many :tasting_note, through: :tasting_note_flavors

  validates :name, presence: true, uniqueness: true
  validates :detail, presence: true, uniqueness: true
  validates :category, presence: true

  enum category: { woody: 0, winy: 1, fruity: 2, floral: 3, sereal: 4, smoky: 5 }
end
