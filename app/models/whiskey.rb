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
#  processing             :integer          default("single_malt"), not null
#  rarity                 :integer          default("stable_supplyed"), not null
#  region                 :integer          default("scotch"), not null
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
  has_many :whiskey_flavors, dependent: :destroy
  has_many :flavors, through: :whiskey_flavors
  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks
  has_many :tasting_notes

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true # , uniqueness: true 必要そうであればコメントアウト＆DBへ定義追加
  validates :mouth_feel, presence: true
  validates :flavor_strength, presence: true
  validates :rarity, presence: true
  validates :processing, presence: true
  validates :region, presence: true
  validates :amazon_link, presence: true, uniqueness: true
  validates :amazon_image_link, presence: true, uniqueness: true
  validates :amazon_impression_link, presence: true, uniqueness: true
  validates :whiskey_flavors,
            length: { maximum: 3,
                      message:
                      I18n.t('activerecord.errors.messages.upto_three') }

  enum mouth_feel: { light: 0, a_little_light: 1, balanced: 2, a_little_rich: 3, rich: 4 }
  enum flavor_strength:
    { delicate: 0, a_little_delicate: 1, normal: 2, a_little_smoky: 3, smoky: 4 }
  enum rarity: { rare: 0, a_little_rare: 1, stable_supplyed: 2 }
  enum processing: { single_malt: 0, blended: 1, single_grain: 2 }
  enum region: { scotch: 0, japanese: 1, bourbon: 2, irish: 3, canadian: 4 }

  def bookmarked_by?(user)
    users.pluck(:id).include?(user.id)
  end

  def similar_to_self
    whiskeys_same_drink_way = Whiskey.where(drink_way_id: drink_way).where.not(id: id)
                                     .preload(:bookmarks)
                                     .eager_load(:flavors, :tasting_notes, :whiskey_flavors)
    return nil if whiskeys_same_drink_way.blank?

    original_flavors = flavors.map(&:category_before_type_cast)
    whiskeys_with_similarity = []
    whiskeys_same_drink_way.each do |whiskey_same_drink_way|
      similarity = 0
      comparison_flavors = whiskey_same_drink_way.flavors.map(&:category_before_type_cast).tally
      original_flavors.uniq.each do |i|
        similarity += comparison_flavors[i] unless comparison_flavors[i].nil?
      end
      whiskeys_with_similarity.push({ whiskey: whiskey_same_drink_way, sim: similarity })
    end
    max_similarity = whiskeys_with_similarity.max_by { |i| i[:sim] }[:sim]
    return nil if max_similarity.zero?

    whiskeys_with_similarity.filter { |i| i[:sim] == max_similarity }.sample[:whiskey]
  end
end
