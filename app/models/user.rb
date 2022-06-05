# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  best_bottle      :string
#  crypted_password :string
#  email            :string           not null
#  name             :string           default("ユーザー"), not null
#  role             :integer          default("general"), not null
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  has_many :tasting_notes
  has_many :bookmarks
  has_many :whiskeys, through: :bookmarks

  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: lambda {
                                                          new_record? || changes[:crypted_password]
                                                        }
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :best_bottle, length: { maximum: 30 }

  enum role: { general: 0, admin: 1 }

  def own?(object)
    id == object.user_id
  end
end
