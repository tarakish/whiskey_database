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
#  rarity                 :integer          default("stable_supplyed"), not null
#  region                 :string           not null
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
class Whiskey < ApplicationRecord
  belongs_to :drink_way
  belongs_to :snack
  has_many :whiskey_flavors
  has_many :flavors, through: :whiskey_flavors
  has_many :bookmarks
  has_many :users, through: :bookmarks

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true # , uniqueness: true 必要そうであればコメントアウト＆DBへ定義追加
  validates :mouth_feel, presence: true
  validates :flavor_strength, presence: true
  validates :rarity, presence: true
  validates :region, presence: true
  validates :amazon_link, presence: true, uniqueness: true
  validates :amazon_image_link, presence: true, uniqueness: true
  validates :amazon_impression_link, presence: true, uniqueness: true
  validates :whiskey_flavors,
            length: { maximum: 3,
                      message:
                      I18n.t('activerecord.errors.messages.a_whiskey_has_upto_three_flavors') }

  enum mouth_feel: { light: 0, a_little_light: 1, balanced: 2, a_little_rich: 3, rich: 4 }
  enum flavor_strength: { delicate: 0, a_little_delicate: 1, normal: 2, a_little_smoky: 3,
                          smoky: 4 }
  enum rarity: { rare: 0, a_little_rare: 1, stable_supplyed: 2 }

  def add_flavor(flavor)
    whiskey_flavors << flavor
  end

  def remove_flavor(flavor)
    whiskey_flavors.delete(flavor)
  end

  def has_flavor?(flavor)
    flavor.whiskey_flavors.pluck(:whiskey_id).include(id)
  end
end
