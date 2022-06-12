# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  avatar      :string
#  best_bottle :string
#  name        :string           default("ユーザー"), not null
#  role        :integer          default("general"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader
  has_many :authentications, dependent: :destroy
  has_many :tasting_notes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :whiskeys, through: :bookmarks

  accepts_nested_attributes_for :authentications

  validates :name, presence: true, length: { maximum: 20 }
  validates :best_bottle, length: { maximum: 30 }

  enum role: { general: 0, admin: 1 }

  def own?(object)
    id == object.user_id
  end
end
