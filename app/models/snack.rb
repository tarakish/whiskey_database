# == Schema Information
#
# Table name: snacks
#
#  id           :bigint           not null, primary key
#  description  :text             not null
#  english_name :string           not null
#  image        :string
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_snacks_on_english_name          (english_name) UNIQUE
#  index_snacks_on_name_and_description  (name,description) UNIQUE
#
class Snack < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :whiskeys

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
end
