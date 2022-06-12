# == Schema Information
#
# Table name: tasting_notes
#
#  id           :bigint           not null, primary key
#  comment      :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  drink_way_id :bigint           not null
#  user_id      :bigint           not null
#  whiskey_id   :bigint           not null
#
# Indexes
#
#  index_tasting_notes_on_drink_way_id  (drink_way_id)
#  index_tasting_notes_on_user_id       (user_id)
#  index_tasting_notes_on_whiskey_id    (whiskey_id)
#
# Foreign Keys
#
#  fk_rails_...  (drink_way_id => drink_ways.id)
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (whiskey_id => whiskeys.id)
#
class TastingNote < ApplicationRecord
  belongs_to :whiskey
  belongs_to :user
  belongs_to :drink_way
  has_many :tasting_note_flavors, dependent: :destroy
  has_many :flavors, through: :tasting_note_flavors

  validates :comment, presence: true
  validates :tasting_note_flavors,
            length: { maximum: 3, message: I18n.t('activerecord.errors.messages.upto_three') }

  before_save :remove_null_of_flavor_ids

  def written_by?(user)
    user_id == user.id
  end

  private

  def remove_null_of_flavor_ids
    flavor_ids.delete('')
  end
end
